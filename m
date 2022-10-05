Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282925F5B78
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 23:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8631510E783;
	Wed,  5 Oct 2022 21:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DEA10E789
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 21:11:09 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id q17so57827lji.11
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 14:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=LTqZVtGTo4LnOvaWLfy6AvLCxwm8iledHO3/h6h8ZG4=;
 b=vYbuqqJ8hieu4+MpYmk+2m0P5EjfWLCq6SKr9qQm5P3Ba7pmCS4lwB0cIXEu6b8/P+
 oNhBDCWK0qubtWQeeaEKIdT3OH3Zsik6IZ+M6bu/jxkIpcWUZPxZtthSq2sTVGXVGbyc
 UBWdeFtV0N2dR3hwOWUEp5ubNs0FTVXNLqu1QeC2rKCnm8doXRP0IYAmWvxDaH2u40Ut
 YpsyMnIXzitmmMOfO14g+m2NcX0rTG0FZ8IlGtYPukPSFceFVkYEOkPUFuHOrD3LRs0z
 D/L/V/MOAv3Vd1+HZ0na0QTG+H/OrxdOTDq24Oqlz0tTfGj9I0yuYWU/TNA75Hz1PAyO
 /mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=LTqZVtGTo4LnOvaWLfy6AvLCxwm8iledHO3/h6h8ZG4=;
 b=v1vmzBos7FiIeQ54uDq9A1I1fRXsVl2Bp4wxLMuPEEzsMXU40iVK7hHGlkjJtsJA7V
 x6Oils9jZO5Ogp1ovCsqKyHFYYRUanlqQiWvCa5WSC0w0zz2NOYk2ze77UFOkJnj7VMn
 IEwQOdhMtI1Zxw/V7UPObxT7ET6hsSg43uM7vO2hzg0xCLxvI40gy9N5mFL3fJrT9g8E
 NJ4tcYaa7xTOWrUrEfW2NPW6GjFO8uNl23Z1DU/YxtFx37hTdtMGfEHyFKC0RBOpMlmg
 hAnE+sfBqB4pRZIaJcC6kQ8j+b8R7BRysghR209LE6UYrVvv0Mt9FaPGPrzXIBZr9qP6
 Y8vw==
X-Gm-Message-State: ACrzQf35qWVnCaQOo4ojWgoTs2ETiR8W+pJx0tZl4WxZwaSh+y3mQt7U
 PmLC/+QRkdqmDtVkFzp28qak/Q==
X-Google-Smtp-Source: AMsMyM6mOxWgJmjfeqUJWO09AxgXEEuf6jq3lkAHauJp9T5jJNPh0Rh36vCwi7uAI7Miji8Yt2V5pg==
X-Received: by 2002:a2e:a602:0:b0:264:5132:f59 with SMTP id
 v2-20020a2ea602000000b0026451320f59mr575673ljp.0.1665004267588; 
 Wed, 05 Oct 2022 14:11:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a056512115000b0049ad2619becsm2454720lfg.131.2022.10.05.14.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 14:11:07 -0700 (PDT)
Message-ID: <bdef4aec-f9b1-48d9-874a-2511a0f213de@linaro.org>
Date: Thu, 6 Oct 2022 00:11:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 5/7] drm/msm/dsi: Account for DSC's bits_per_pixel
 having 4 fractional bits
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Daniel Vetter
 <daniel@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>
References: <20221005181657.784375-1-marijn.suijten@somainline.org>
 <20221005181657.784375-6-marijn.suijten@somainline.org>
 <CAA8EJpr=0w0KReqNW2jP8DzvXLgo_o6bKmwMOed2sXb6d8HKhg@mail.gmail.com>
 <20221005205845.rwkzyit4daizi3z4@SoMainline.org>
 <20221005210845.yednmbqec4bzukxm@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221005210845.yednmbqec4bzukxm@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 06/10/2022 00:08, Marijn Suijten wrote:
> On 2022-10-05 22:58:48, Marijn Suijten wrote:
>> On 2022-10-05 22:31:43, Dmitry Baryshkov wrote:
>>> [..]
>>> In fact, could you please take a look if we can switch to using this
>>> function and drop our code?
>>
>> [..]
>>
>> Do you want me to do this in a v3, before applying this fractional-bits
>> fix?  [..]
> 
> One thing to note:
> 
> 	/* bpc 8 */
> 	dsc->flatness_min_qp = 3;
> 	dsc->flatness_max_qp = 12;
> 	dsc->rc_quant_incr_limit0 = 11;
> 	dsc->rc_quant_incr_limit1 = 11;
> 	dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
> 
> Here a bunch of properties are hardcoded, seemingly for bpc = 8.
> mux_word_size is only ever read in drm_dsc_compute_rc_parameters() so
> only becomes relevant _after_ the migration, and is currently dealt with
> correctly by:
> 
> 	mux_words_size = 48;		/* bpc == 8/10 */
> 	if (dsc->bits_per_component == 12)
> 		mux_words_size = 64;
> 
> Aside fixing that to assign these values (through the proper constants)
> to dsc->mux_word_size, is it worth looking for the right parameters for
> other bpc or return -EINVAL if bpc isn't 8, to uphold this comment until
> support for other bpc is validated?

I'd say, return -EINVAL or -EOPNOTSUPP for now, let's fix that later. 
It's definitely a separate change. Let's wait for a device with such 
panel to be able to test it.

-- 
With best wishes
Dmitry

