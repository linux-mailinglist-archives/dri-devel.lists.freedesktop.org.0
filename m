Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5B49FFF83
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 20:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF6110E79C;
	Thu,  2 Jan 2025 19:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AVtKwCsc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609FE10E771
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 18:18:26 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-21661be2c2dso144827925ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 10:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735841846; x=1736446646; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KcsYGT2jr/Cwk+E0bZ78S9/+2iE2NBGtFjNzzo30vdQ=;
 b=AVtKwCsc364YLBREgNtCCRIOg64XzSCfDS5OfAFZB/rzNEyzWAH3OVI3ZXe5B1q3e5
 Z94rkQ1mpZjozDhAnc0l5GcAR/nyXBFmPhK36vpntHEfs/QDFve1VHlXQWysJiv/J7L7
 C50f12ZO0tF+/CrvYYsmY5k/G2MQZyYTyc7aTr4Tk3DQhhO7EMqD9IqjbEOzGj5N5sil
 1IwX+3Zm5/6kFw81JX71fEK/vPkRG06YWy9tQ9FgeXfqqhLZCp645a4cLhJcMYSMuzju
 lUrW58MvtLjBoEfHNLy68NrBvtn22PgwVHi3LqGmnHqHm5GbwsZw/7k2Cg9vvGm/J5yI
 ZQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735841846; x=1736446646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KcsYGT2jr/Cwk+E0bZ78S9/+2iE2NBGtFjNzzo30vdQ=;
 b=hDWi+HgRaKR1L5R4c3H1dYb+6nDhpQmMZJ9LNm+qjfF94teDuB/RDfTte3CCJtxzN0
 9rGQMAeBgIH5iYQaBUbJBbCJGdt9Dpt1kvXuZdsx0FsS7fisVOKqx03vQO4UAbhOlZid
 LvBlncSEbm9KB2pJ3Nf6nlCC3ee+yM1kJl75ArxU4nFvYOEapuZIMj2K1HEyvHSf4pGZ
 VqVDi+n//jxSke+5+sYX0mrPD8nwY1aYjnOMTnjlRqAM6PRpLVY75I6CBSchDvr4WGxf
 vGya78AAW+/HCupMR74t5SCfVtza5CpsYjZ440hKJxB5E57dKlRa3w9Mluc5eMV2kMvf
 rknQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZh36VTfji4cSCZFkFDW4soAOX1bL919hzc8j1CPsu9tzniddkxu27smPK9MIJbLRDP311uZgyT+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxndd4iKuq765kF0u15oOkc+uWEv/7jkuIbjV8c0UzvNeOtk3mR
 bIoiVMVo51h/YDzL6TFjeLN47J0tE6itBr6ucJ+fJh6UNh5vvgr+
X-Gm-Gg: ASbGncuEvHvdGdrsRKEbbITSXbKFDVhzk/rethl+p+gGE+R8u+xMcggkBckRGJZdVBq
 jB7YDeu1NADVzJm5aZwVQtHUBVnaoSUWAynPh3sYFmHJzDIpe94PIjHfCTUY2V7ts/HibwdwcGS
 IZmpqWMjJhtATvj/V6lMjXiuzjNx+ufvlYyLKBgcsQ/acC8nM8KR+gKPVECTyM9os074xKQ40Fo
 dpdMKldN276+K0FC6DY1T0BPJ6oO2AAUrhsJkxdn/ld25oDifdASeobyPvn
X-Google-Smtp-Source: AGHT+IGUftEvjzgeM5eRfZJQJDkV96dM36oyQ3FUyp6cKSKianTN7IVhYXtyu9gI0RnxWUv7Qt/Czg==
X-Received: by 2002:a05:6a21:78a5:b0:1e1:a0b6:9882 with SMTP id
 adf61e73a8af0-1e5e046331fmr66924613637.17.1735841845904; 
 Thu, 02 Jan 2025 10:17:25 -0800 (PST)
Received: from smc-140338-bm01 ([149.97.161.244])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad816305sm24535993b3a.31.2025.01.02.10.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 10:17:25 -0800 (PST)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Thu, 2 Jan 2025 18:17:22 +0000
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 Zijun Hu <quic_zijuhu@quicinc.com>,
 Alison Schofield <alison.schofield@intel.com>
Subject: Re: [PATCH v4 01/11] libnvdimm: Replace namespace_match() with
 device_find_child_by_name()
Message-ID: <Z3bYMiOG0u3Jtv3h@smc-140338-bm01>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-1-583cc60329df@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-const_dfc_done-v4-1-583cc60329df@quicinc.com>
X-Mailman-Approved-At: Thu, 02 Jan 2025 19:43:55 +0000
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

On Wed, Dec 11, 2024 at 08:08:03AM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Simplify nd_namespace_store() implementation by
> using device_find_child_by_name().
> 
> Reviewed-by: Alison Schofield <alison.schofield@intel.com>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/nvdimm/claim.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/nvdimm/claim.c b/drivers/nvdimm/claim.c
> index 030dbde6b0882050c90fb8db106ec15b1baef7ca..9e84ab411564f9d5e7ceb687c6491562564552e3 100644
> --- a/drivers/nvdimm/claim.c
> +++ b/drivers/nvdimm/claim.c
> @@ -67,13 +67,6 @@ bool nd_attach_ndns(struct device *dev, struct nd_namespace_common *attach,
>  	return claimed;
>  }
>  
> -static int namespace_match(struct device *dev, void *data)
> -{
> -	char *name = data;
> -
> -	return strcmp(name, dev_name(dev)) == 0;
> -}
> -
>  static bool is_idle(struct device *dev, struct nd_namespace_common *ndns)
>  {
>  	struct nd_region *nd_region = to_nd_region(dev->parent);
> @@ -168,7 +161,7 @@ ssize_t nd_namespace_store(struct device *dev,
>  		goto out;
>  	}
>  
> -	found = device_find_child(dev->parent, name, namespace_match);
> +	found = device_find_child_by_name(dev->parent, name);

Looks good to me.
Just one general question.
The function device_find_child checks parent and parent->p, but
device_find_child_by_name only checks parent although they share the
code except the match function. Why that?

Fan
>  	if (!found) {
>  		dev_dbg(dev, "'%s' not found under %s\n", name,
>  				dev_name(dev->parent));
> 
> -- 
> 2.34.1
> 

-- 
Fan Ni (From gmail)
