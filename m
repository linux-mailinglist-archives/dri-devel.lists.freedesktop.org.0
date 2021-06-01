Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46180397361
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0646EA40;
	Tue,  1 Jun 2021 12:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175D06EA40
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 12:37:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id n2so14209466wrm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=q0VBZ1AmByAwe483WcR/T7rzmaJh9QClItlEm17BvFI=;
 b=d2Hgau+jcqalZ4sy6NlOFUwOXyUHs4G8vNJNITWkEyxo6ZTyRi0W+W7PkycmX1qqM1
 L2MXvn4TJ/hQsqIjFiXcuXZ8PPNjEBm5UHAseOTHzAhWiyJhmQNfJroG0qDHmhBVpnkQ
 fdbn0Xx5DBVT1+FqgqWHbRbvatcuxeg5apstgUHyoJfqoEbx/CQadfM9af7BQL3ZxXvU
 KJCmMhbuq0nj8S/7W0oMu522gOGO3Pz4d+yOiMzKi75fYABMUfVkWEQ0Fwf7Xlvq5Ip1
 0QQg+LNGMQWrdzySFIqcrJFQTO7nJwNhIIXtjT4/r3dDzwYp+JyoTiPeX5j+yJvIrUtQ
 SxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=q0VBZ1AmByAwe483WcR/T7rzmaJh9QClItlEm17BvFI=;
 b=HU1+pfvTiSCdCBpfWtVlOAEgGb0ovguSgPV9xNGMOhG6/+aO0TtQm7w36AiavjS1h0
 Peb0JT8K7x93XGytSjDqUu3P8hrP+SDmV0CPr94TCt+Tk2tiHdWwltSfNaOfE92+uquR
 Vse5ZF26zzX2AleaCFoGLmONXhAF7e4X211RMdPH4ufFsncn9eCS0PZr2MsbdTV5Vc4Q
 BsREHAgM6wkVoiTS+MOIihohOUQdJgJe5RWKaeLrPB0ErQGadXCICSACsPk0k9OjRNwP
 MEM8RIZRTnvYshxrhWjY08HlFXBtsIx+NQRxsfoF/WSyC8FlszEgVZ0BQpW8gnjHuoUe
 bj6A==
X-Gm-Message-State: AOAM532UON1UpIOkwBejAg8VOua+Si2nKrSiP5IAWFr8UWpo3NlGV7ps
 lICcWr9diDZ3zTZ/mrbnjjHTNw==
X-Google-Smtp-Source: ABdhPJx+WkixZCBNz3HyAM2qy3S4l/JY78r8hqeHHTCllSX5rLccBj2FPCaEijRD6IGJi7GnZig83w==
X-Received: by 2002:a5d:6484:: with SMTP id o4mr26822370wri.8.1622551030771;
 Tue, 01 Jun 2021 05:37:10 -0700 (PDT)
Received: from dell ([91.110.221.249])
 by smtp.gmail.com with ESMTPSA id b10sm3900609wrr.27.2021.06.01.05.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 05:37:10 -0700 (PDT)
Date: Tue, 1 Jun 2021 13:37:08 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: Re: [PATCH v2] backlight: Kconfig whitespace and indentation cleanups
Message-ID: <20210601123708.GF543307@dell>
References: <20210517095839.81833-1-juergh@canonical.com>
 <20210519110300.17918-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210519110300.17918-1-juergh@canonical.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Juerg Haefliger <juergh@canonical.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 May 2021, Juerg Haefliger wrote:

> Remove leading whitespaces, replace multi spaces with tabs, and fix help
> text indentation.
> 
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>
> ---
>  drivers/video/backlight/Kconfig | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
