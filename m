Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE9A4F808
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 08:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175E110E703;
	Wed,  5 Mar 2025 07:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jBBkb/AG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B1A10E706
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 07:39:21 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso43632135e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 23:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741160360; x=1741765160; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+XuA+TgzxO0cDd+59g+qU1yGMkksNmClDdcwOzwAMqE=;
 b=jBBkb/AGmNehIPLGGlW5qdhnGzHMWmYeJwtRX5oJr2ZCEBCHS6GgMoWACGj13Tswuo
 qEpb1WM0hXTw0FcJ/l62qGPvcU87icsmJjOcmYrX4vh1HFux7CmajpnbI6dHuaw5ldpz
 tWd4BRBKq5LpBiK38Ah7YllWjdbVRkb2G2590=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741160360; x=1741765160;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+XuA+TgzxO0cDd+59g+qU1yGMkksNmClDdcwOzwAMqE=;
 b=drpFUNystENzdQ9ebmzCdjBgJTggNkf9H+zgH2ZVUy10VVhHINVeTVRrp1DKKJMqTs
 90CG4eTKc8ERG63Fo42/YSD82LE1Tc8+s636cz8383ZPKBQPiitO7bjo2ueTjtQ0WDI+
 5ngWkXGcrHXpcKt3i1HNXa+DjBGHQRsmir5yIGBRATRpH0Dz6+SMpIoyepmx03EW3Md1
 HGBHzuf3cbqdatwp4lAHwwDcndqMH7G7uP1Fq+rKMpmB6IlidHBuk3A7YJW2Py5QWI3G
 55VivdoiMQjmXmhPAx/VmrzzUCaVhoSvh8bHLFe7YcWooqi5JhR3g4P34SpCrY31Dye2
 7CjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNKVjI+zIqjc9BjVsbKmY0g3hvi7wssbQvk0W+CaukgDp7201yZOUv+XDitvmqSVGshTxwq/794Fc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4VuX3uhhDUtwH1N+2KDt4rVqSdl0B68jyS3LH6ocZ97ztJtpG
 76RN4Za7mslJZy80PPbNpYmrDlsRdfJZ7RxdBF3tMulFnTDO6VeJX2RtJLvmkCI=
X-Gm-Gg: ASbGncsWuY0sdoIZL8Lvo9n139/PHobFlu8dGd9FvN1PZMW+74IL4OTnhWxWqzmLW23
 PoNg7sACjqhJ/uUpjz3kzKJym2/E4jmdDSZ4For6tcQaSrkeyrwF6xCXUMcT9cDwD75E1IGwaV4
 /JvZCYsO8GyKPhxhwQmf9qYYSqoL/JJFKzmr+iOAaHE+u6QCs4i8dhnw9+zin7aKO9fSIZlugK5
 OvUlcsIVCdnCDyHpSsmy3JitiHamC4UpXHUTEIom9zKCZ3ufC9g3blRwUWoTNGnC3Egm6JMMect
 uc8vJDIqcM1W/yXbb5fLk/f+ScrkbOz5unpJcFWxS0obo6Us3/LNMqBM
X-Google-Smtp-Source: AGHT+IHNDniz1S5hPDkK5ssZDMLDexZifLYl1krGvetjlRdBrr6MVPUh3DFLsQ8NIkK7+0HJSn4e8Q==
X-Received: by 2002:a05:600c:6b10:b0:43b:d531:ca94 with SMTP id
 5b1f17b1804b1-43bd531cc69mr5061085e9.3.1741160359980; 
 Tue, 04 Mar 2025 23:39:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426ca07sm9175785e9.2.2025.03.04.23.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 23:39:19 -0800 (PST)
Date: Wed, 5 Mar 2025 08:39:17 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Matthew Wilcox <willy@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] fbtft: Remove access to page->index
Message-ID: <Z8f_pcnaC5iJMz-Z@phenom.ffwll.local>
References: <20250221173131.3470667-1-willy@infradead.org>
 <27cc53b9-0db7-451c-9136-5fdcf42145f7@lucifer.local>
 <Z8coiv3rn8loOltq@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8coiv3rn8loOltq@casper.infradead.org>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Tue, Mar 04, 2025 at 04:21:30PM +0000, Matthew Wilcox wrote:
> On Fri, Feb 21, 2025 at 05:53:16PM +0000, Lorenzo Stoakes wrote:
> > On Fri, Feb 21, 2025 at 05:31:29PM +0000, Matthew Wilcox (Oracle) wrote:
> > > There is no need to print out page->index as part of the debug message.
> > >
> > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > 
> > LGTM from my side,
> > 
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> This patch is not yet in linux-next; can I expect it to go in soon?

Being both staging and fbdev it's double orphaned, I stuffed it into
drm-misc-next now, thanks for the ping&patch.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
