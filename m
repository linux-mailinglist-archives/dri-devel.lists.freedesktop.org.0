Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA556B70D7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 09:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A95810E48C;
	Mon, 13 Mar 2023 08:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7DA10E48C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:06:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r18so10392404wrx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 01:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678694812;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=9T+gkmJSh/A2WDenopQxXDLhV/ur6paK/JrT18X4nWg=;
 b=Iv2G+78gmnXK8UQXnG5coj7nchQy0urUJWA33kXXuQCkEHq0M8FyQVkN9fuD3d/Lxz
 oz7w8I4FDjvTlXPGpV0pu6GAyV/JtBXyAUEHwpZgC7TPrI5W7CpKUwPifVBWfzulZMvt
 UseUIx6NL6dsyRGuyYmqz7d5kuC0by3WjL4QimOraxJXHBUh/Lct2FtU1RjVjMs/HVhx
 Jx6QteCrEAMRnK0UfN63xCVZCW55Xgq97f1A1sLzcTqvyJZrL/95+ChN8oZPJbVkiEpp
 bKA5wN1wvxvLWFKFT7TYp6wyxS5wSZ+dW0R+ZkUAQFO7B2ftfkgxFoP5Gtc8Pffkt0Iq
 wjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678694812;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9T+gkmJSh/A2WDenopQxXDLhV/ur6paK/JrT18X4nWg=;
 b=Ia39ygwd26YgSlNkkM2JWik2/eb+wWwGgO0YwIaELFJPlV0MlVekcFpWTCJgwgknNJ
 olpA84Pd4WNbx1+o0mMput3xhge6kW+9qkITS6ePJEFTHd7i3I3+Yt23KrJL3SgGLXsR
 n28JUkTeQLb/uy2VDjFnmujYY2B3c9o/hLCkIfBUjD2XFXyOub+U3QtmivbOO19MoCfp
 6QtVQRP4ERwx13O+z13QSXyj7UXHcgeVTr+MJ9fl4lSZqGnIlM02MwVDuSO8SEtu5uFv
 YeaiIxfrYwyAtNZKXxzEiDYfmc9bIimEwunFztlCXHL0zHiE7M5K+/i9eyO2an6X37nv
 0tLA==
X-Gm-Message-State: AO0yUKV8OEp9Jk2mEAoumIlkWNOKQGZ5GdxE2iOxM6U2T6UzbaVPb0df
 lrM0x+Jcyh6EVaEkF2fnGk4TaQ==
X-Google-Smtp-Source: AK7set+szlV9cCWtDnSfEmND682iNy8nj0kpvAQc7fC4DpuzG1k9PBJAPBfXxESaTRweKTfRFyKB6Q==
X-Received: by 2002:adf:ee90:0:b0:2c8:9cfe:9e29 with SMTP id
 b16-20020adfee90000000b002c89cfe9e29mr20978010wro.38.1678694812121; 
 Mon, 13 Mar 2023 01:06:52 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 x1-20020adff641000000b002c70c99db74sm7124861wrp.86.2023.03.13.01.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:06:51 -0700 (PDT)
Message-ID: <6c02557d-372d-05b1-2998-7c2cde99fac7@linaro.org>
Date: Mon, 13 Mar 2023 09:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/2] drm/panel: Add driver for Novatek NT36523
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230311123231.20771-1-lujianhua000@gmail.com>
 <20230311123231.20771-2-lujianhua000@gmail.com>
 <904bc493-7160-32fd-9709-1dcb978ddbab@linaro.org> <ZAx4KqXw+an555d4@Gentoo>
Organization: Linaro Developer Services
In-Reply-To: <ZAx4KqXw+an555d4@Gentoo>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/03/2023 13:46, Jianhua Lu wrote:
> On Sat, Mar 11, 2023 at 01:38:52PM +0100, Konrad Dybcio wrote:
>>
>>
>> On 11.03.2023 13:32, Jianhua Lu wrote:
>>> Add a driver for panels using the Novatek NT36523 display driver IC.
>>>
>>> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
>>> ---
>> [...]
>>
>>> +
>>> +static int nt36523_get_modes(struct drm_panel *panel,
>>> +			       struct drm_connector *connector)
>>> +{
>>> +	struct panel_info *pinfo = to_panel_info(panel);
>>> +	int i;
>>> +
>>> +	for (i = 0; i < pinfo->desc->num_modes; i++) {
>>> +		const struct drm_display_mode *m = &pinfo->desc->modes[i];
>>> +		struct drm_display_mode *mode;
>>> +
>>> +		mode = drm_mode_duplicate(connector->dev, m);
>>> +		if (!mode) {
>>> +			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
>>> +				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
>>> +			return -ENOMEM;
>>> +		}
>>> +
>>> +		mode->type = DRM_MODE_TYPE_DRIVER;
>>> +		if (pinfo->desc->num_modes == 1)
>>> +			mode->type |= DRM_MODE_TYPE_PREFERRED;
>> That's not quite correct, as that means "if you have more than one
>> defined panel mode (say 60Hz and 120 Hz), there will be no preferred one".
> This piece of code I see in the other panels, so I'm not sure if it is
> correct. Should
> if (pinfo->desc->num_modes > 1)
> 			mode->type |= DRM_MODE_TYPE_PREFERRED;
> is correct?

I think only a single mode with DRM_MODE_TYPE_PREFERRED is preferred,
so:
if (i == 0)
	mode->type |= DRM_MODE_TYPE_PREFERRED;		

would be the right thing to do.


Neil
>>
>> Konrad
>>>

