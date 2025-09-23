Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594CDB95CFE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 14:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95AC10E085;
	Tue, 23 Sep 2025 12:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z41Q1g71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA4E10E085
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 12:19:56 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3e8ef75b146so5190593f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 05:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758629994; x=1759234794; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sTK3npgW5FQLE4nPFWDBCNYEm3feIUUETDGkLbnmceI=;
 b=Z41Q1g71AEyGGeMgBvZOh09Zq5u5taUa6p8SbiHOfECJsVfOwmF5xrIsmvN9ayBXWX
 WzacopzKKQOA0WLqZswghj7JpRfyEu2UAo9JJXI3oA8ot+wv1x/bOytbe6sC/7z8ExlK
 Yjdv0YQ5YlQFhLMn2v1QiModPAoxKUXhRjlqG1f/i0yUV5K9wpvQQM/n1Np9QXBFOkDn
 H699cmP1p3O78P6o5hETxVxGULnqRAGOtEOntsiIyesQiFPoI2kaYKtef86QiL781CAt
 1I67B9bThqIhk4lIxppxIABA8s9UgeFsr0I8h0dO34pP+9G85LXQTnwYwmnY4VR5/rFF
 Mf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758629994; x=1759234794;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sTK3npgW5FQLE4nPFWDBCNYEm3feIUUETDGkLbnmceI=;
 b=p7ua9pO7rqFU7Ce/xKwlOX0DmI2SPvxv/N02Qib3qMDTDhji5eAKnS8MWPB/1LGhsL
 qyxz9rFuF+8gHVH384mZdqqsc5cIu9nqQza3PEUatCm983DY/cI07Ohn1X/U3mXgXcGL
 KVt+FmbrSYG0tI0X2fp1EM8SXaH+aIeF42Q8Q6uIhgneSe6P0izIFpiU0DqNPwrvH0Cx
 +Dmx4YJ3wI9UgccDlWaBNuJzN5I4lBjlPtoChJi6cY4KcB2mbA+E0S0UgOYpik8nVuCD
 mydzxB9eVYGyFDexi8O6hFxRAcH8Ro8UudB3RsOzU5zqZrHP+LTzYnRIUX1mrS4k3M/6
 yuCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZsCpReBXI94XMLW8yikWN9sJB7aojHp2jIqQR9uAtvB/OfwIIlbYjgq0UMmvNEGhO2CSyqHa0wlc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW7xgBQZuR0IprZ8t9o3H+t/4BpyyfFBCqh719vSTHA3XWYsw5
 ic8s4dhWuuhCZyJlN7GaTkkIUnM0jCpj5UAfVZ3WBPh1PiqrOgVX+yQcgz6WzPPAFio=
X-Gm-Gg: ASbGncvWkzFHrYqzN9OHsWaLcuQ31l9Zw3asnLs1rE1UKtkhWroRfFrWWwgU4X0viJL
 gy/DY8keEMkS6GnYX+Kk3+4J4QosAXNT3oWEkW85Sfup741cG53uarcBlzR4PxVyMLDtcIQWqVb
 F+y891FggrFdPzj1M4CQ+VtKeXwuGeHdSQPLKReBHXVqNIMQWT2Ch5S0Ehk84k9wfw3sbJeMBtX
 Cs+HNgQ84bv439QwweN98uLqJiHK4I7wwWaTLrae9KECUKMz1RhxlMAvqnMZzLGYw4z5PO2TNAu
 zVprZctpFMZfnijXpCDHitpZ3JgmoBZE64KG/NkgJpUBu/ElyUT9fK8xyURNuYeuIS1XZ8bxZOi
 OpOwCmoQp1hkgfnE/JKx1WjyRqOzW
X-Google-Smtp-Source: AGHT+IHzh4QmoPQ01FP6OX2MtxPxTNk8wndU9qAYqgeeBa3Ms/9nlpcl+WJEjK2427UHhz9Vf1Arow==
X-Received: by 2002:a5d:5f49:0:b0:3ea:80ec:854c with SMTP id
 ffacd0b85a97d-405c5ccc9fcmr1639265f8f.19.1758629994203; 
 Tue, 23 Sep 2025 05:19:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3f61703b206sm13621550f8f.6.2025.09.23.05.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 05:19:53 -0700 (PDT)
Date: Tue, 23 Sep 2025 15:19:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dma-buf: fix reference count leak in dma_buf_poll_add_cb()
Message-ID: <aNKQZqWwWu_8WesG@stanley.mountain>
References: <aNKBIcpF6kZRG6Mg@stanley.mountain>
 <7bb48401-ed99-4263-addd-ec1462d68168@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bb48401-ed99-4263-addd-ec1462d68168@amd.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 23, 2025 at 02:00:28PM +0200, Christian König wrote:
> On 23.09.25 13:14, Dan Carpenter wrote:
> > Call dma_fence_put(fence) if dma_fence_add_callback() fails.
> 
> Well that change is obviously incorrect.
>
> When dma_fence_add_callback() fails we already call dma_fence_put() and drop the reference.
> 
> When the dma_fence_add_callback() call succeeds the callback will drop the reference.
> 
> The problem here is that the return code of dma_fence_add_callback() is an integer error code instead of a bool and basically has the reverse meaning than what people usually expect.
> 

Ah, yes.  You're exactly correct of course.  Sorry about that.

regards,
dan carpenter

