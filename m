Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5827162758F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 06:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B83910E24C;
	Mon, 14 Nov 2022 05:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B42D10E24C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 05:29:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g7so17592536lfv.5
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 21:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ShWkmDDgnIz8JEqHGHDUzJovR/KTvgrYk+MdmxwWEAI=;
 b=M6oFjAb9H7upWMZ1gY9NJ/kc+g+erCu4WoGXXCT5lXPWnl/RXxHPBTyV1KLUAIHk/A
 Rh1Uu5LoghwGvCVeRw6EUkrnlIddm8KAzSiHZmjCvXNysfvrnd0qW6TX1wnYEj0+Ntg1
 dMdGYWp12oCxRSDO9/tGsx7Ss9JIR5Ot2vM5zHDsYGR5kuiTHiJGcThUFil0RkgluNJe
 T6KHP0I9HC28qUedf9RlDsPxpzClAF20mdHbH+PTwn8hzN+CgKep+SNR+WgTHUhlvM2t
 AB/NU2n/Gd7pApevS+qZtZM+UtC6drf1StNYHKztiToLi01hC8obboH3EOyekflc0NxH
 FHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShWkmDDgnIz8JEqHGHDUzJovR/KTvgrYk+MdmxwWEAI=;
 b=0owxUT4WtGcrvz918Mlw5ZYAJqiPds/RQadfD41hv3+lmlSZTctStVJ4+FQer5NF07
 e8NCucJqy/BT+8+Cqt171BvrbvvkUlc759QFx3n9AA/A5zsuBkQDQXrK/f9kWXtqRXFo
 +7MrZhDsx7Ik5jBNgIEOZisOdpkGawWPf5Dp+I5UGXobtLpCfdMT+mLB13StnZ5Ww0sc
 1qI8hiDEUmT+9Sy0uKQpiDqhIo0Wfna1+VQOKfDHHQwaKZ9mJ78JgF8iuRXk2dHN0hJL
 E05L4F2a5Z6IAjDXNBbGcaTh6CXAUGWlqzVmOpj0LoQpYLfqiBxzojKp2IEhbeSrrQns
 7fLA==
X-Gm-Message-State: ANoB5pkPRo7K4bEoZ8aVkD/JqVUsQgcdiMPdXUlCWpMvNYlh+FkQEo1i
 g2lWP4VCfR7r5M5ODbuNoRA=
X-Google-Smtp-Source: AA0mqf5TWJtZdRvaHwV/5KDeT3EQPkceXrM7vRnjgc+TPA5daxKBhc5Fe7Yu+19sY5q2HEPVall2CA==
X-Received: by 2002:a05:6512:3b0c:b0:4a0:13b:6618 with SMTP id
 f12-20020a0565123b0c00b004a0013b6618mr3442388lfv.15.1668403787592; 
 Sun, 13 Nov 2022 21:29:47 -0800 (PST)
Received: from thinkpad-p72 ([78.133.163.249])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a2eb107000000b0026de0c8098csm1853693ljl.26.2022.11.13.21.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Nov 2022 21:29:47 -0800 (PST)
From: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>
X-Google-Original-From: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
Date: Mon, 14 Nov 2022 06:29:44 +0100
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v2] udmabuf: add vmap method to udmabuf_ops
Message-ID: <20221114052944.GA7264@thinkpad-p72>
References: <20221113150511.8878-1-lukasz.wiecaszek@gmail.com>
 <50cece73-a499-eba3-7018-9e92e0791c88@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50cece73-a499-eba3-7018-9e92e0791c88@collabora.com>
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
Cc: kernel test robot <lkp@intel.com>,
 Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 13, 2022 at 07:35:20PM +0300, Dmitry Osipenko wrote:
> On 11/13/22 18:05, Lukasz Wiecaszek wrote:
> > +static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
> > +{
> > +	struct udmabuf *ubuf = buf->priv;
> > +
> > +	if (!ubuf->vaddr) {
> > +		ubuf->vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
> > +		if (!ubuf->vaddr)
> > +			return -EINVAL;
> > +	}
> 
> Create a new mapping on each vmap_udmabuf() and add the corresponding
> vunmap.
> 
> Otherwise persistent vmapping shall be released together with udmabuf.
> It doesn't look that persistent vmapping is needed for udmabufs.
> 
> -- 
> Best regards,
> Dmitry

Right. Thanks for review and remarks. Adding vunmap sounds reasonable to
me. Will add it somehow this week.

Regards,
Lukasz

