Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5400F43117E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 09:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511166E97C;
	Mon, 18 Oct 2021 07:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296FA6E97C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 07:40:03 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i12so39477947wrb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 00:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VZmNs2GkzxhCB6JvBYnlodKD9/a6gtDFwX3G4j5wn7c=;
 b=oae7VeX5cuVbu+3yaIg3mCW2czfOxBXemxBlIV/GCmMSn7Aj2S36Cfp2Ej1UN5iZ5R
 n59i410Rso7mM0FYctJy9Qcza9G7OPMt45JKHUkjj6gBXOXrZRQAgeNQpdFKYAcQAEz7
 fH5nbg0HrhbN8+KrPKuJ7HuL25jtsyaBWXOj5r+0BQf3Gm4sPejcfTRk7JOD2IPARhbb
 PTY3ehD/1Hq9lRlRsZFej21R6JCPLFZaC7iMr2NOI1bvdhADA+KQof5JmF3BjK26vzl0
 nElkg51iqJ/x/8vso6C0mKXQNW3QhtimFsVQVB/gyiqi2UTiOrrGhPYGG3J+dq9snEA0
 mlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VZmNs2GkzxhCB6JvBYnlodKD9/a6gtDFwX3G4j5wn7c=;
 b=bCm/igdDNKLlSfL/sq4kpTmjtgX6xkHRq3LUEbw06N+YQZBB5Kuax2UVc8hRqoGU+M
 wdkfa85C0Zx1fx3IzGajqZSzpe0gA5cnHaXDHydDBUJnmVsKgLd0lsdyLNo2LYvCp+4p
 I/IXfFy0b2bQXYLvOwVlVTUu5jVC5G07uVQb4HMxmHq6xEg01/aG8Gl0hDyMdU+UZw/u
 1Fwv+3s9KforockIJpvr3ksjb2FxUmiFALsE2Yw/B2V7/ATGkYaCsB1AS0NOjWeCMt+q
 UwZBHGOwISiveWmbXivN3G349a814bHOtvdXmqiumtHXFbIZ6Ez6eS8+YblgHeZMP9K9
 wM7A==
X-Gm-Message-State: AOAM530BNSh0hUzOJqaDxV0BY+G7aWWh3k5J93j0kKaa6GiZYdsqjZsm
 Hwk6t/Ds9YKFsae+MWbxw/k6AQ==
X-Google-Smtp-Source: ABdhPJyHqY72fbaXwdf2acp6AUOMOZIy/6NHYEKRPlWsRaHyfSV7hxwz4gN1tq143M0gfexGnALqSQ==
X-Received: by 2002:adf:aad4:: with SMTP id i20mr34082320wrc.402.1634542801469; 
 Mon, 18 Oct 2021 00:40:01 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2dd7:d5eb:6e87:f924?
 ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
 by smtp.gmail.com with ESMTPSA id z135sm6889997wmc.45.2021.10.18.00.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 00:40:00 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] drm/meson: encoder_cvbs: switch to bridge with
 ATTACH_NO_CONNECTOR
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, sam@ravnborg.org
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-7-narmstrong@baylibre.com>
 <CAFBinCBwO0CJMPA3K6e8OxXcinzrA5LrSqaKu1XtZPWLXT8Krw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <7a921d1d-84b4-c3e4-8f7c-10db5ad42ecf@baylibre.com>
Date: Mon, 18 Oct 2021 09:40:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBwO0CJMPA3K6e8OxXcinzrA5LrSqaKu1XtZPWLXT8Krw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi,

On 16/10/2021 00:34, Martin Blumenstingl wrote:
> Hi Neil, Hi Sam,
> 
> On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> +static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
>> +       .attach = meson_encoder_cvbs_attach,
>> +       .enable = meson_encoder_cvbs_enable,
>> +       .disable = meson_encoder_cvbs_disable,
>> +       .mode_valid = meson_encoder_cvbs_mode_valid,
>> +       .get_modes = meson_encoder_cvbs_get_modes,
>> +       .atomic_enable = meson_encoder_cvbs_atomic_enable,
> I did some testing on boards where u-boot doesn't initialize the video outputs.
> It seems that meson_encoder_cvbs_enable() is never called with this patch.
> meson_encoder_cvbs_atomic_enable() is called though.
> 
> From what I can see in drm_bridge.c [0] this is even expected.
> Does this mean that we need to move all logic from .enable to
> .atomic_enable (and same with .disable -> moving that logic to
> .atomic_disable)?
> 
> The same comment applies to the HDMI patch.

Good point, I'll fix that for both patches !

Neil

> 
> 
> Best regards,
> Martin
> 
> 
> [0] https://elixir.bootlin.com/linux/v5.15-rc5/source/drivers/gpu/drm/drm_bridge.c#L717
> 

