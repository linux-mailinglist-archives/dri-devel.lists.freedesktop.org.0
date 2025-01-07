Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6B3A03706
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 05:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871A610E1DE;
	Tue,  7 Jan 2025 04:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D0Q6vsUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BA410E1DE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 04:30:27 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-5189a440a65so8805193e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 20:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736224166; x=1736828966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w6CQdG/Y4q2PglLk/FT3YvtdH/92Je/f7NVKLOTx5Co=;
 b=D0Q6vsUaIOhWXOGjJnuuleWavThpFsY6X19I0I3Ke066fT4PRHszUY+ucUrzirrww5
 MzrGlbjrWZrXI/MoU9GrGSkGIrGyNgpp8nxC9K0XXtgklft0cquiF4Lmw3w3g14pCcGa
 3O1T3n4Tc8WKdzzUyqJlKJpMtsTsHbCM3MwtOHGw4PIKWAQQJbC2DSmFu/5xTZE7jG4b
 TFuuJLoLgwNnYvm/PRRum3cSXASErpaMHql3aNuPlQOmqt8xiHInGlfg6s0jSKZ+GckP
 RmRhBKjQmG94eOKfaUtKL1NoRXlHc3HgPTp/B7N59kFKqjf/6Oi2XoMyaDeMCjYEyq4m
 UXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736224166; x=1736828966;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w6CQdG/Y4q2PglLk/FT3YvtdH/92Je/f7NVKLOTx5Co=;
 b=HZq6BgqNW4JO8SXofudgx31AyLVvocq8WAJ4RAEVbWlvkJMCPsoKK0IwM89ROLeTJz
 sYP7820w7T99Ezp4ELiDy09AlyXjTrw/NbpCateCOvxk27sXRNBYDTviQ17QzutiExeH
 /yQtgadgKRacWq+vEh4W19QTbPQGwwVnMlZtWFxQTbD5yG8A8hlmqZmmNcA+MVKaYEOT
 qwCQGRa53oQ+mAqTnXskSbNF0Bb5DuKJNqJ0fczMiSTX3N7ADbPpI3lSuUJilEUAkEgW
 Y267fMdcqVORgqPP6k/M0GIwLVTnepL+02mQbTzu7q7IUeor6y8fbhRO6xF/bFg9dB57
 Io5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWExfdMQNpVJ6/1C/tEOCSf7kNhlIv7njZ8gnDfOGupD76u+U5+ZngZBkWJNUpKmspYqcHIidyrHpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoGGSjiIyxGktmsSEQ1HfUkXzVfaK/270vjFanr8jSpfhR5A12
 YkT/gsFsYaYKUeYcQ1LgkreVQ3zgvNBq5zCiy8o7HullAPozFLhTtvHu9eMP
X-Gm-Gg: ASbGncuxTCPiqPb8ZvSKNxZLWe3E+5YHCSc2REAB9QMXYO0B1+FBYC2qIev9gATorwT
 xS05dNiJSmc8LfARnwZlOzUxpll/NtD1xIBNsz5Xv/xJGu3ZrCx9S5FlMfhpTMCIjP19r103Ug1
 kjgNPj0+KIDqUyXOMNnSYfSzWlTONybFc8B3bo1DhvKM9x0qN8p4vPX6/gNsGAY1sWGR3/fxRc8
 VHe6iwhaGac6sLxffWJp5YfvoJBzCO714Z5Be30kRGHSOyzgLgf8urnq1HQ
X-Google-Smtp-Source: AGHT+IGQP+p250RicnrOecD1qZzwLXKfTbwqgnYA71mtSK1nRSXJmRGp4vGU/0NrWqqg8k1UH71nhw==
X-Received: by 2002:a17:903:41c3:b0:216:485f:bf90 with SMTP id
 d9443c01a7336-219e6ebad3fmr772319765ad.27.1736223707140; 
 Mon, 06 Jan 2025 20:21:47 -0800 (PST)
Received: from [10.3.72.248] ([59.152.80.69]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9d4474sm302366525ad.142.2025.01.06.20.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 20:21:46 -0800 (PST)
Message-ID: <70f0dbf2-dd84-4a50-94cc-1d388c5c93fe@gmail.com>
Date: Tue, 7 Jan 2025 09:51:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: xinpeng-xpp055c272: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>, neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241223052049.419831-1-tejasvipin76@gmail.com>
 <47738b2b-351b-4df9-a50a-f4dff51441c8@linaro.org>
 <CAD=FV=WEEbC+LB9TM8VHDgO41=XPdgJR6eSYHo=KytDbPTROqw@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=WEEbC+LB9TM8VHDgO41=XPdgJR6eSYHo=KytDbPTROqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 1/7/25 5:37 AM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Dec 30, 2024 at 2:10 AM <neil.armstrong@linaro.org> wrote:
>>
>>>   static int xpp055c272_unprepare(struct drm_panel *panel)
>>>   {
>>>       struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
>>>       struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>>> -     int ret;
>>> -
>>> -     ret = mipi_dsi_dcs_set_display_off(dsi);
>>> -     if (ret < 0)
>>> -             dev_err(ctx->dev, "failed to set display off: %d\n", ret);
>>> -
>>> -     mipi_dsi_dcs_enter_sleep_mode(dsi);
>>> -     if (ret < 0) {
>>> -             dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
>>> -             return ret;
>>> +     struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>>> +
>>> +     mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>>> +     mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>>> +     if (dsi_ctx.accum_err) {
>>> +             dev_err(ctx->dev, "failed to enter sleep mode: %d\n",
>>> +                     dsi_ctx.accum_err);
> 
> You should delete the above error message, right?
> mipi_dsi_dcs_enter_sleep_mode_multi() reports the error for you, I
> think.
> 
> 
>>> @@ -155,17 +147,19 @@ static int xpp055c272_prepare(struct drm_panel *panel)
>>>   {
>>>       struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
>>>       struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>>> -     int ret;
>>> +     struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>>>
>>>       dev_dbg(ctx->dev, "Resetting the panel\n");
>>> -     ret = regulator_enable(ctx->vci);
>>> -     if (ret < 0) {
>>> -             dev_err(ctx->dev, "Failed to enable vci supply: %d\n", ret);
>>> -             return ret;
>>> +     dsi_ctx.accum_err = regulator_enable(ctx->vci);
>>> +     if (dsi_ctx.accum_err) {
>>
>> I would rather keep ret instead of abusing dsi_ctx.accum_err, but it's already like
>> that in other converted driver so I won't oppose it...
> 
> FWIW, we had this discussion before. I agree with what Tejas did here
> and I managed to convince Dmitry Baryshkov in the past. See:
> 
> https://lore.kernel.org/all/CAA8EJpr_HYkXnP3XR9LpDhi1xkQfE_CKJzfzGrO5qd_pQYtiOw@mail.gmail.com/
> 
> Looking specifically at this driver, using "ret" would have added
> complexity when we wanted to do "goto disable_vci" because in some
> cases the error code would be in "ret" and sometimes in "accum_err"...
> 
> 
>>> @@ -175,30 +169,19 @@ static int xpp055c272_prepare(struct drm_panel *panel)
>>>       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>>
>>>       /* T8: 20ms */
>>> -     msleep(20);
>>> +     mipi_dsi_msleep(&dsi_ctx, 20);
> 
> Personally, I would have left the above msleep() alone. There can be
> no errors at this point in the code, right?
> 
> 
>>> -     ret = xpp055c272_init_sequence(ctx);
>>> -     if (ret < 0) {
>>> -             dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
>>> -             goto disable_iovcc;
>>> -     }
>>> -
>>> -     ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>>> -     if (ret < 0) {
>>> -             dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
>>> -             goto disable_iovcc;
>>> -     }
>>> +     xpp055c272_init_sequence(&dsi_ctx);
>>> +     dev_dbg(ctx->dev, "Panel init sequence done\n");
> 
> Should the above print be only if "accum_err" is 0? That would match
> the previous behavior. I guess I would have also left the print as
> part of xpp055c272_init_sequence() unless there's a reason for moving
> it...

I don't think it should print only if accum_err is 0. In the previous
code, it would just print after all the msleeps and write_seqs are done,
with no error checking at any point.
The reason I've moved the print outside the function is because we are
able to reduce a couple lines of code by passing dsi_ctx to the function
instead of ctx. If I'd kept the print inside, it would require us to
declare a `struct device*` variable which would require ctx as far as
I've seen and just overall introduces some lines that we could otherwise
avoid. I've done this in a couple other panels too.

I'll do a v2 with the other suggested changes.

-- 
Tejas Vipin
