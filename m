Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5904794EB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 20:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA6A10E3FF;
	Fri, 17 Dec 2021 19:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A244E10E3D3;
 Fri, 17 Dec 2021 19:38:26 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y12so11739344eda.12;
 Fri, 17 Dec 2021 11:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xBhbHR1ZRRnmsqap7tOmhGUkA6633FczKv2Mv4aRZVs=;
 b=gfA8uTswdtNIYDKecjnSpPNhnsQvzILmqtqsQeltg5uZSC8WGVwvopa+iP9gMkqTLd
 3AdIUAwQJpPG+0MDBcQOl9i3I9dPauwNXoxHuRkmd/+qAjPkoTFiXz13KWuP55finnkw
 GMCuTAZBB4o/S27hteDBDLj/C+Kt8dVOIDQtCfV/mBoieqky/9kgLiS/rwQT6hixncEQ
 IqhOAKBPuHbHOJrZebvUv9CdFmb/4THZYpmXXA4RRM8kPDE7k0JZp2Lc9+2OPaIn+GgX
 KVz2ku0L41HwZcT3e8kK87VZqPlO+KpDJhiNzV2zg0nmHvfUuOM44lSzhvJEsY26mJPw
 YaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xBhbHR1ZRRnmsqap7tOmhGUkA6633FczKv2Mv4aRZVs=;
 b=Chy4jHxktjzsEzNrQQJ+mXuGiP41QowXaIvoonA4blfRVWMoHEZ/+l9jEntgqJbcJH
 bhxLFZlnLXs0A3wpWilJaLp/P3vExTAWk5xsKwJ/PR0fge9qcNh7uTGbiLEz3S9xeseP
 b/y5c5lrMleKqpcEZ7z1Q5qTC7FrKlQp4j9jCG8jBp8V9kOs5gpV/Fp7MxCbQrcnciyJ
 LeSgAyqv6THnIM9FGQxqN5NWDDE2c5k+wgU8Cx25Jx9de6iqFW9mWIERlhJrC3lofwf5
 OL/wFU79/zhBCZEpx9H2Vg3BRkyDaHZkZkOcjEPmHv58bR75kj4YnOClzIA6ethRJAj8
 OSNw==
X-Gm-Message-State: AOAM530oK5HlaeXl49XL4fz5vCgxRMJA7tPPeVmmDsMJicWpRkDge3YA
 KX7aVJrNuOEMISNx5VZZ8RzejxsbWFTDKKc3/iI=
X-Google-Smtp-Source: ABdhPJxuNpCkbRyKgYvx//uFZV9IzzvMt7TXuzGY6FMxVKyNkiHr7yrR8Vs4AOyWWCFM+WtZEkBDhZxoe7jY8z8WSQo=
X-Received: by 2002:a17:906:4787:: with SMTP id
 cw7mr3496614ejc.311.1639769905119; 
 Fri, 17 Dec 2021 11:38:25 -0800 (PST)
MIME-Version: 1.0
References: <20211217105928.3182024-1-l.stach@pengutronix.de>
In-Reply-To: <20211217105928.3182024-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 17 Dec 2021 20:38:13 +0100
Message-ID: <CAH9NwWdb6Frmg6T6kkxD4oo-ua=enuB_OepamhK13qDEhrb+Gg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: limit submit sizes
To: Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Fr., 17. Dez. 2021 um 11:59 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Currently we allow rediculous ammounts of kernel memory being allocated
> via the etnaviv GEM_SUBMIT ioctl, which is a pretty easy DoS vector. Put
> some reasonable limits in to fix this.
>
> The commandstream size is limited to 64KB, which was already a soft limit
> on older kernels after which the kernel only took submits on a best effort
> base, so there is no userspace that tries to submit commandstreams larger
> than this. Even if the whole commandstream is a single incrementing address
> load, the size limit also limits the number of potential relocs and
> referenced buffers to slightly under 64K, so use the same limit for those
> arguments. The performance monitoring infrastructure currently supports
> less than 50 performance counter signals, so limiting them to 128 on a
> single submit seems like a reasonably future-proof number for now. This
> number can be bumped if needed without breaking the interface.
>
> Cc: stable@vger.kernel.org
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
