Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7981B1144
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 18:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE136E138;
	Mon, 20 Apr 2020 16:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63D36E138
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 16:17:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x18so12954194wrq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lPlsXqCGHYagVYmxec3j/xxnK3oND8ckDanm4J5g6+s=;
 b=Bc3VkmccqsOZmy8SzqwTXHtw4ju1n3q+E8tqpZL08g24yfYOc29x2qPJOm5bPv7VMv
 IEz+3ozJmMWTBd04ErA+L4wk/0PjyHp2gejrFY5Hp1yD2/uez5UT5BiJtnb2iaKP2/vs
 SMSQ9qo0pSxEIrRcKZjgoiC7AmF9J9UhdaxfOXmCw9U+Z7w4klykH6tQCy/7+4as4UVZ
 6dwxlkXGI1NYgtaY7Zu976/NOzffZXZNDeuwtcNtImP4kZT+274B4qypkT0Y1nH8llDD
 JsBWFcA+GtHbhUA2Dcnw5yiEJEg8239BHg+veY10eVi55Nn6heaw7SXMjo2wxSsUe+mj
 guyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lPlsXqCGHYagVYmxec3j/xxnK3oND8ckDanm4J5g6+s=;
 b=MZZD6mhHW9R64ZIU7l7XpnXufEXiktZhCIH0uiDD+39utpv3DI8PhPSZ/YbE6farYM
 50Y5oei0+MsUeUxea0qQD5MCEs12JUJ+VKl6wjP09DKpedroX9xrSwtmVVWJB2GZlLYl
 XcxYOvU4QOqaivxTBnERgpZDhtdG8Vfrw79xvrJwymAhN12TkcPEhG3c4G7q6ihq02U4
 Tlw0wlEXV95E7utP/F4i0CvAk1NVYIHRIXx9w5lx5LHRJFX/aAliqs+0msXZU4XK8yBd
 Hlh/OVP3x7C7yA/5pnalpHuqh9v3Vvv3EWFET+m+vOOHyokEDQTkkpvIEPEc1HJTRSS6
 yslw==
X-Gm-Message-State: AGi0PuZ0OlELvpoSeFzYoSxlMqD3N5SyLyeObR4Y8z75SMRAuXOKEb1e
 Z6fXquh1Txpr4a1zh/Zt6I7oSg==
X-Google-Smtp-Source: APiQypKrkeOBy7c9A/9ySH8hmTQpSPXDqk6tEE5oq0yFe5+sxi9L2pzoxp9Luyj6lNrqui3ig6qFsw==
X-Received: by 2002:adf:800e:: with SMTP id 14mr18882781wrk.369.1587399443572; 
 Mon, 20 Apr 2020 09:17:23 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s9sm1946164wrg.27.2020.04.20.09.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 09:17:22 -0700 (PDT)
Date: Mon, 20 Apr 2020 17:17:20 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V5 2/4] backlight: qcom-wled: Add callback functions
Message-ID: <20200420161720.cuxponga4vxitrwi@holly.lan>
References: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
 <1586274430-28402-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586274430-28402-3-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 09:17:08PM +0530, Kiran Gunda wrote:
> Add wled_cabc_config, wled_sync_toggle, wled_ovp_fault_status
> and wled_ovp_delay and wled_auto_detection_required callback
> functions to prepare the driver for adding WLED5 support.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
