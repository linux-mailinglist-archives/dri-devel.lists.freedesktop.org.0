Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6E48E624
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C429C10E9E2;
	Fri, 14 Jan 2022 08:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF70710E9E2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:23:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s1so14281210wra.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2SXNoXMdnGaSfy4KnO5GzxkSIdaPrK9msaNZUkt3T8Y=;
 b=TyRi88oeaki7bUJT9yoFyv6wUj9fpeayXEzTbacbcpowHz8FPfwCEa5pPeNp4hic2A
 1LUiMChZ/JgR4XfavZjb1aUuuO2byzLkGj1zOXheJtN63skSUHN8+KmF8d19GagVbsrr
 3fmQKuhufkBrR7HLsFJkJOrO+niqCVoiY6pXytGHfK3Z/P2h4xZlwMO0M6mfyCp643jF
 mVBK4R++pEHgYWm8fqj840V0Bd7FVUMAC9/gMdKD2vUoCfCbBcTjHl4ISxc5ELSpzHNM
 hEOssy1EdHg2qUjygRA/8pzlYYvPdaPBs1bBkE4hJnxLCH+S/QkVvPnwozU/+o0Z1GpP
 y65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2SXNoXMdnGaSfy4KnO5GzxkSIdaPrK9msaNZUkt3T8Y=;
 b=7hOgPu3MFfCDi8UbUdERujRKpvsTIm0AinAYZnRzWI/f/8tYHlP93hgwpqtLOz/qbo
 4SRUQmSqUrbBCnG3mdNgxN1ARZqsZ6O6kVwXbryqkwHhUHEA0uL7RPL81qeF3oZzXgT5
 JrPfUmimwl4XiuQDzXv7QtG/5dxdvpA6Ai2epWvkJoWVGlukT8p3pcJdo2W3JldSTA6Z
 ODEH8qQGZSRsg3+eJ/fBH38+Kru+egmP9zsP7CsOB+RERwpUVKK6TIs6+gAUh74T6dy2
 94RAcNyzyNjZhMADhVKLvXUeHKjY0Z6nsZxP7uPiG9WqMU8Itsd6/aC69/jVsyAjawcU
 tnlQ==
X-Gm-Message-State: AOAM530qSE0pjv2f32QWgN9NKrPZtE1MWy40jbHwz02n5hwR+8wV+Xbu
 MG/85n4jvLXOEZKfkmIJy2i0Gg==
X-Google-Smtp-Source: ABdhPJwtTLFQyCczvzEvPARkSbWXpC8Q4vilLBDbd9n7KTtKKzr0kpI3M6BrzPhUDH5NWo5f3LRQ0Q==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr2909142wru.714.1642148633286; 
 Fri, 14 Jan 2022 00:23:53 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:a3fc:c40b:5afc:88ee?
 ([2001:861:44c0:66c0:a3fc:c40b:5afc:88ee])
 by smtp.gmail.com with ESMTPSA id i82sm5990464wma.23.2022.01.14.00.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:23:52 -0800 (PST)
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
To: Fabio Estevam <festevam@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
Date: Fri, 14 Jan 2022 09:23:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
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
Cc: "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 13/01/2022 21:01, Fabio Estevam wrote:
> Hi Biju,
> 
> On Thu, Jan 13, 2022 at 2:45 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>>
>> Hi All,
>>
>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour) till the commit
>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts callbacks").
>>
>> After this patch, the screen becomes greenish(may be it is setting it into YUV format??).
>>
>> By checking the code, previously it used to call get_input_fmt callback and set colour as RGB24.
>>
>> After this commit, it calls get_output_fmt_callbck and returns 3 outputformats(YUV16, YUV24 and RGB24)
>> And get_input_fmt callback, I see the outputformat as YUV16 instead of RGB24.
>>
>> Not sure, I am the only one seeing this issue with dw_HDMI driver.

This patch was introduced to maintain the bridge color format negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR,
but it seems it behaves incorrectly if the first bridge doesn't implement the negotiation callbacks.

Let me check the code to see how to fix that.

> 
> I have tested linux-next 20220112 on a imx6q-sabresd board, which shows:
> 
> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with HDCP
> (DWC HDMI 3D TX PHY)
> 
> The colors are shown correctly here.
> 

The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the negotiation fails and use the RGB fallback input & output format.

Anyway thanks for testing

Neil
