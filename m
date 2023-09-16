Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA927A30E5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 16:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8454010E121;
	Sat, 16 Sep 2023 14:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8561910E121
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 14:32:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31c93d2a24fso2855817f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694874766; x=1695479566; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RuCMRYRUI5pE2pACmrLEmespxY+dxj38Ol7yGsVBHSU=;
 b=DYFm6H1JQXPtJsjWU7A+oa5OzcEJsBwlu7Yl1z3gNjaGiK17FDN+CrzlU9/fsxovbA
 KRNhEYTJPIdQHrciOmEJCYsQD/o24HcN0yeZFlwpyjS7FpLgSOlFmeu+VdaFvt8ldidA
 4VwEo6tstF2FtI+vwc9d4w2YUZIt7a+nSw5C0ezi4ZxmheEPx2T7Uc6slFa2Uy2p2TaW
 iQ8APdMFWUhZZfqvvRE9HiPoSF5eK0XL1Stt1N3IKLXLhgLmOEzls4PLm0MZagGi7uCp
 Kzrx5LsjdLUKU7N9dlopzb7Y5BaKyNIXzpME8m+foDCozOsXnvFfPX0mtA99yVwUIfdZ
 uqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694874766; x=1695479566;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RuCMRYRUI5pE2pACmrLEmespxY+dxj38Ol7yGsVBHSU=;
 b=uAEzCmtwbLd324GJX2DlULq8D2N/QtRCnIppGaEvv5TRRlcVmE+LME6K2hqfvmV7Vf
 EhgKr5FjiDBtENZUr7MPOwAcWKDSakLfY0pb+SSxGasyiNGSUD0LR4GyeEJWNu4SrpWc
 fPGbhne9FqEcwtI9DvtJ9K9F6NBThbahdz90sRXSmCW+FaICYopHLRMA+yrDJ3gKGydw
 3Y6gm+evmSBWz77R9Qbg3+BqHiTlRip09yLxmJg/gS/Uh8wFyaNq/YeU8HFHtbfDaSzW
 +4s0mfd4J4xktDHqc7Yauzw/rLjx1NkB4KsExR39diUj980ADONpJzzB7sE2JyHj2BXK
 n8Sw==
X-Gm-Message-State: AOJu0YzX+cB6YJY0ItU/FetOpRQ/G76sQccdRfAwxrJmyFk8MQuGtxCr
 VAVsed8klSJRB76TWUBFNTcVIA==
X-Google-Smtp-Source: AGHT+IFo2cGGQRjJb8BtVCZ+zzLXMvuJine6w6l4fG9U93EB+rQqIuIbo58+ykYvKJeUmr2pjBhAfA==
X-Received: by 2002:a05:6000:a1a:b0:31f:facb:e1ba with SMTP id
 co26-20020a0560000a1a00b0031ffacbe1bamr2807958wrb.70.1694874765714; 
 Sat, 16 Sep 2023 07:32:45 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 j15-20020a5d604f000000b0031779a6b451sm7270032wrt.83.2023.09.16.07.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 07:32:45 -0700 (PDT)
Date: Sat, 16 Sep 2023 17:32:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v2 1/5] string.h: add array-wrappers for (v)memdup_user()
Message-ID: <b219788a-69e6-44cf-a609-91f9640967f5@moroto.mountain>
References: <cover.1694202430.git.pstanner@redhat.com>
 <93001a9f3f101be0f374080090f9c32df73ca773.1694202430.git.pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93001a9f3f101be0f374080090f9c32df73ca773.1694202430.git.pstanner@redhat.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 kexec@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 David Disseldorp <ddiss@suse.de>, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 08, 2023 at 09:59:40PM +0200, Philipp Stanner wrote:
> +static inline void *memdup_array_user(const void __user *src, size_t n, size_t size)
> +{
> +	size_t nbytes;
> +
> +	if (unlikely(check_mul_overflow(n, size, &nbytes)))
> +		return ERR_PTR(-EOVERFLOW);

No need for an unlikely() because check_mul_overflow() already has one
inside.  I feel like -ENOMEM is more traditional but I doubt anyone/userspace
cares.

> +
> +	return memdup_user(src, nbytes);
> +}

regards,
dan carpenter
