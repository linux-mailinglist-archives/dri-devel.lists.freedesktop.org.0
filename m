Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B835C264AE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D37910E2F6;
	Fri, 31 Oct 2025 17:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eaauR3Y2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410B410EBF7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:10:57 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so1654868f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761930655; x=1762535455; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0UiwqRJqkZXUe5MyPuxH5cks4+QEZvrm/OruvGxuDf0=;
 b=eaauR3Y2iJ2cVw5URaa5J5Ii1GOooI5SbuKf6bf6ReGe/kDh9/qxf1zQZLXG6DYoQM
 oJDI4ufFhjqKS8oeOD75pG76W8vmwX1FFjWKi9EDsjDhgFF3KPR3CjlQkEOoH3UurT7w
 dKM6zSEELqUtTRsQ0H70Z2lmidDKr/Vt22J1cMPd63VdZiMrqKSwOYBOb/33akxf+LFV
 yRsegtohnZhee6OcCw4kddn8hIONJD5YxHMmVm33zcc85RzMnRVB65n5gVSl3wVHkuLu
 X8b4lPuukxuCwNUP2FUYuBtSvloiFOKloaerYHW6tsfIN884tolQFQjSbQzPZZATCHxt
 vVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761930655; x=1762535455;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0UiwqRJqkZXUe5MyPuxH5cks4+QEZvrm/OruvGxuDf0=;
 b=tnrdYXj4aQ22PxmFk+ubZnLFNV5qIW03KuyL+SKBFYhSxNA49fzXFGvzXQH4flKqDL
 6N9CHlr8c57+EeCXg2T7M4CJXNarQu0HLzc740aWgNEvAT6r/QyusDa6lhyM/Ewp/kbX
 gW+8hEtHUYabq2s/YYvfub1YrR7dORQkK4dGhizryM5NJZbdNZwQVEoIRpfPDqsdBohs
 VF8sLyyrRj96RH4XhpwAlb1Ob+CRw42M8J0dvMQDCxirmk+daFVcp7QrH4AWsxXiLTWn
 0cBMpg5KPeAPcQj92XtL8mUzUOAW19fF5P2zhvLKXGR44AVAzd1ivcsnzRaXSoJV0+w2
 xOJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYEtiLm3SRnTiHyMM/WJm2aYWZMovLrwIxIDebJ+zN/Eax2p9MbszhpYU30vsl9erna9vgp9EibDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygEbGpPRSsaY6kjY4xSx2J0SDgi9XgbtMzq166i6gX2zj0nWuD
 jXaD/at5p1g0vgoXNpS8N6X9k3zQ0xtlS4/w69XOUJayR6Rm2qWRD5VB
X-Gm-Gg: ASbGncumkhIK6e/paPnY3VnNkoo8wXqBp0mLoLHiWBdhiEVzwXuA7tfirhRSTONIh1Z
 Zo1KD/r9fWqwdsdOH1xZZxia4GTNN9xayyHEDfX8lXWM1TBjlH7F3JW2Boyo6wfkMW8JXkg43K+
 rBhL7Nn5FnCYaktS2pcR0A/EoTy1JaYcryd/ehVTnz44AB/K0hss/qD4x9qj976TweYZsOcGFVs
 +YEdLwKfyImGaOsj0AmpWi/2mFAxv0OljrzE70P1/ekworiQ8uBcOdWFNbk/zzd83Hrqi3618KN
 sonsNiKktCt2S2reuX3xZSchsdo+yYTab9s7pH4RC440atFxf5OWqfsCTGfAd0juITN+WtX40M5
 DxLekNTWUHFaQQ2Iit4WysVwIRePHrLMnzlTW3s20bX6FJg60YemenKaD2D28aadtv4wGPlg6cn
 ZLag==
X-Google-Smtp-Source: AGHT+IHpGDWDV7wqUvqekAtpscxPtUAdqlp3pOzwvpMAnIt26zDqvsJCUbs9jGS8XQvH2aYF+esanQ==
X-Received: by 2002:a05:6000:2410:b0:3ee:3dce:f672 with SMTP id
 ffacd0b85a97d-429bd676a03mr3523737f8f.4.1761930655051; 
 Fri, 31 Oct 2025 10:10:55 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c110e77esm4372653f8f.10.2025.10.31.10.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 10:10:53 -0700 (PDT)
Date: Fri, 31 Oct 2025 18:10:46 +0100
From: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou <rgallaispou@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH] drm: sti: fix device leaks at component probe
Message-ID: <aQTtlvoe96Odq96A@thinkstation>
References: <20250922122012.27407-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922122012.27407-1-johan@kernel.org>
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

Hi Johan, 

For some reason this thread went through my filters, sorry.

Le Mon, Sep 22, 2025 at 02:20:12PM +0200, Johan Hovold a écrit :
> Make sure to drop the references taken to the vtg devices by
> of_find_device_by_node() when looking up their driver data during
> component probe.

Markus suggested “Prevent device leak in of_vtg_find()” as commit
summary.

> 
> Note that holding a reference to a platform device does not prevent its
> driver data from going away so there is no point in keeping the
> reference after the lookup helper returns.
> 
> Fixes: cc6b741c6f63 ("drm: sti: remove useless fields from vtg structure")
> Cc: stable@vger.kernel.org	# 4.16
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/sti/sti_vtg.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_vtg.c b/drivers/gpu/drm/sti/sti_vtg.c
> index ee81691b3203..ce6bc7e7b135 100644
> --- a/drivers/gpu/drm/sti/sti_vtg.c
> +++ b/drivers/gpu/drm/sti/sti_vtg.c
> @@ -143,12 +143,17 @@ struct sti_vtg {
>  struct sti_vtg *of_vtg_find(struct device_node *np)
>  {
>  	struct platform_device *pdev;
> +	struct sti_vtg *vtg;
>  
>  	pdev = of_find_device_by_node(np);
>  	if (!pdev)
>  		return NULL;
>  
> -	return (struct sti_vtg *)platform_get_drvdata(pdev);
> +	vtg = platform_get_drvdata(pdev);
> +
> +	put_device(&pdev->dev);

I would prefer of_node_put() instead, which does the same basically, but
at least it is more obviously linked to of_find_device_by_node().

Best regards,
Raphaël
> +
> +	return vtg;
>  }
>  
>  static void vtg_reset(struct sti_vtg *vtg)
> -- 
> 2.49.1
> 
