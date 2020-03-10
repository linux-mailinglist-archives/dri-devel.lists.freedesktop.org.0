Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D601801C8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 16:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742B36E1F8;
	Tue, 10 Mar 2020 15:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58956E1F8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 15:27:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 6so16437298wre.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3LjI4IW7CuuBnAiNN/wI4Y4tTmMxDl1C2yKa4O1GZZ8=;
 b=GR1hoSXSykV7wG3aWhZ3CvRrOrvKkE3Wph6GSdl9EAA8G3b8myYCdbp67ONYzc7e2C
 W6ITxdGZmpEgWLIHKTi4tZYpoWio+/UPk88nS+D1nX9ykCA7YozN1wfw6TU8Fs33mv3W
 4Q7Bu9/20ZIz7f9+o9wihVmfP/rUiuwcXMqzCFAD2K3GhChQm8bjkkFx61C6TZLc+Sqe
 48H3vto4AiO/NLQ8yyzWT2rrjEEL3E7h/9bRMYm+dpDvjW8fDzIJauWMaf5IeJxyypES
 eeHXTqg0BY+x+f4/b6ZwPOeYXAkTKP7SKzbvSRQO4SlDo/butMMgQ7NiGvk+KhwcIS3t
 5qqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3LjI4IW7CuuBnAiNN/wI4Y4tTmMxDl1C2yKa4O1GZZ8=;
 b=Vz5M5MNLzfZJfs060ijNtNi5XqCwYoxaDQI4+St8+ObE1xlmwvmYhh9wxLitZfklbY
 hfJyn9KK7VxURHUgN52F2g8UDPuKVwzrgj6UWs8CXbQK17yYdQV/FwHCdha271LBauJG
 D0XRLrVfy3r8ZALw1uWQ+5Kf7gfdJTp0PBxM/nETiALCmyR5e4TTZTke3b0odSg/u7Uk
 0mpRw5ENkFyeozkPlKC9ss0c5DsvxfMeAldeVNxRcERrs4yzx+fDAl6O9Pu6gaWxctf3
 4c+dzo9yQ8NvOb7y5lEWVM0e4QVRUwRhtqjmrxp39nYApfVn+d56CCggw5mNqWwTHic3
 VcoA==
X-Gm-Message-State: ANhLgQ2+gjms9kJxtJwadk3Bg5GkxfYVAfczIZKKV8t0YyNgz5VyvIdl
 FCtlsC2UWMPdmarRUlSHpCvsjEAe3fW4aw==
X-Google-Smtp-Source: ADFU+vsBBggc0x97WUZ6qoSZO8TvflomuxqqHU8axLnY+M4+YZhPfZvivjKVKcGlYgMIXbh9zjDycA==
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr26644695wrx.14.1583854042426; 
 Tue, 10 Mar 2020 08:27:22 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id i204sm4374823wma.44.2020.03.10.08.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 08:27:21 -0700 (PDT)
Date: Tue, 10 Mar 2020 15:27:19 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V3 2/4] backlight: qcom-wled: Add callback functions
Message-ID: <20200310152719.5hpzh6osq22y4qbn@holly.lan>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
 <1583760362-26978-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583760362-26978-3-git-send-email-kgunda@codeaurora.org>
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
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 06:56:00PM +0530, Kiran Gunda wrote:
> Add cabc_config, sync_toggle, wled_ovp_fault_status and wled_ovp_delay
> callback functions to prepare the driver for adding WLED5 support.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Overall this code would a lot easier to review if
> ---
>  drivers/video/backlight/qcom-wled.c | 196 +++++++++++++++++++++++-------------
>  1 file changed, 126 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 3d276b3..b73f273 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -128,6 +128,7 @@ struct wled_config {
>  	bool cs_out_en;
>  	bool ext_gen;
>  	bool cabc;
> +	bool en_cabc;

Does this ever get set to true?

>  	bool external_pfet;
>  	bool auto_detection_enabled;
>  };
> @@ -147,14 +148,20 @@ struct wled {
>  	u32 max_brightness;
>  	u32 short_count;
>  	u32 auto_detect_count;
> +	u32 version;
>  	bool disabled_by_short;
>  	bool has_short_detect;
> +	bool cabc_disabled;
>  	int short_irq;
>  	int ovp_irq;
>  
>  	struct wled_config cfg;
>  	struct delayed_work ovp_work;
>  	int (*wled_set_brightness)(struct wled *wled, u16 brightness);
> +	int (*cabc_config)(struct wled *wled, bool enable);
> +	int (*wled_sync_toggle)(struct wled *wled);
> +	int (*wled_ovp_fault_status)(struct wled *wled, bool *fault_set);
> +	int (*wled_ovp_delay)(struct wled *wled);

Let's get some doc comments explaining what these callbacks do (and
which versions they apply to).

cabc_config() in particular appears to have a very odd interface for
wled4.  It looks like it relies on being initially called with enable
set a particular way and prevents itself from acting again. Therefore if
the comment you end up writing doesn't sound "right" then please also
fix the API!

Finally, why is everything except cabc_config() prefixed with wled?


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
