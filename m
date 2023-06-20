Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202027364DB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8542310E27A;
	Tue, 20 Jun 2023 07:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0624010E27A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 07:38:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f8ff5fe50aso25158165e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687246686; x=1689838686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f9ygZ7yIAEY2d9d/qVhI0amgeoXNE1mQXne5+wfl6TU=;
 b=o8C35uSrEvqAjtB8BTU84BGAVzv5V27RljnynJG/urSw8gln1nYPSK77wTX/DfGNnh
 ouStvQQoAm1BiMsdV+Pcw+zXRKqAij3IDmt8Q2HNlmCce+Vd2wN3J5Mi6IGHqE+xPtWg
 nOOYbZOkx0WbHbuQbSOwjaw2ahP6qphnFUnPhhoeXvR+6dadq1QF43DKO04T6+2dB6cQ
 k0mmoin7wISe+MjOaA9iwZzcYvE71fIewTAp7lygYvIGJrzta3el1COcgZBVi4pftR6T
 ESnilamv1CcDBMgF5FSmjL3cgZG3cWCLhWHtvKy9G86NjjJ0JURiXbkby373yfvzYOgm
 7Fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687246686; x=1689838686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9ygZ7yIAEY2d9d/qVhI0amgeoXNE1mQXne5+wfl6TU=;
 b=DJdFCajJHtBIfTCvU//QIbddnE3LsB11VsNufjL/8Ubfqscb2PRHWX853Wak2omscB
 JU6OvkPSdFEkx0YA+FofX2/UXHzrrTAyeFKhI9/lv9Mx60QbU5P4bHKBTtoGvYLBkzJt
 ICClRUxAFSNMhx4UfmoR3UwrP+JA43K8Nt7kroweTy5efGc83iXcB11x9QONUMOy/Usm
 5qCmhP+wxqVmU/TDyLfVXq/dA9xekddtT8/QjdbdLGOmqsaMfhXSNb3NlyH0XdvkDkAo
 FEC4ozZb1dsAq4z0b+G3bZMhfkGka68oG6sAYOlz+9CncGlgJwEfjAJs5WTqBt3C/Gae
 uDtQ==
X-Gm-Message-State: AC+VfDyYfdbaZSeU/Ncs1+YFGC2gvH97n+3tNqms7ArKhrp7wqzN6AKM
 A7h6Vw03mxnud4qTY6ZPc+p9AA==
X-Google-Smtp-Source: ACHHUZ5FuDhulJo8756eozh0KRopUTsJakAb65F/au8o6bfOt5vQhNQQ7DZNSJsOaDGBmSoV0WMa7w==
X-Received: by 2002:adf:ef10:0:b0:311:ff2:87e4 with SMTP id
 e16-20020adfef10000000b003110ff287e4mr10664853wro.33.1687246686193; 
 Tue, 20 Jun 2023 00:38:06 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 s6-20020adfea86000000b0030ae3a6be5bsm1315337wrm.78.2023.06.20.00.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 00:38:04 -0700 (PDT)
Date: Tue, 20 Jun 2023 10:37:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
Message-ID: <da6c860f-0ef0-44e4-8b58-0f4d55c1b8bd@kadam.mountain>
References: <20230620045919.492128-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620045919.492128-1-suhui@nfschina.com>
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
Cc: Jane.Jian@amd.com, Bokun.Zhang@amd.com, David.Francis@amd.com,
 Xinhui.Pan@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, monk.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 12:59:19PM +0800, Su Hui wrote:
> Smatch error:
>     gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:316:49: error:
>     static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
>     static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> 

I doubt that moving the struct members around is safe.  This looks like
it's in a very specific order.  So I don't think this patch is correct.

The reason for this false positive this code uses a #pragma to pack the
struct.

#pragma pack(push, 1) // PF2VF / VF2PF data areas are byte packed

Sparse does not support this and Smatch uses Sparse as a parser.  The
main reason why Sparse doesn't support this pragma is because Linus
thinks it's gross.  You probably didn't even see the #pragma did you?
And anything you can't see is unreadable by definition.

"Mark the associated types properly packed individually, rather than
use the disgusting "pragma pack()" that should never be used."

https://lore.kernel.org/linux-sparse/CAHk-=wi7jGZ+bVbt-UfXOkpEQdHzF3Z2HBjkGdjh8q4dvPPGWQ@mail.gmail.com/

regards,
dan carpenter
