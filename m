Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C9D651F0E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC5610E38A;
	Tue, 20 Dec 2022 10:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8411710E002
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 15:32:00 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id l10so9356745plb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 07:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7x+HLm2LEKBALh0UPyepB61DxgpkHAaYRV17vBSdzQ=;
 b=mfX3/vGgTUcHTz91n9+IQbt/3pn/J5z8qpp5HorpSke3E8Hm+t3vb8ZrTnsfUJwObk
 9pOoxYIpTHAqkMV37ZI3QNr1Ppqi6LG0g8JHz8/f9h7IqsgOKYrcSAxl033rrZwWqRhQ
 AS2Ic0QEFczuMbjN3S0/8ytHeCyjMxmCwi4nElDRPV43LaVSGF4aBoUMtWtv6Ry4S//I
 TTJPW/5bFoTbcsDeyaGRdYJiBd1j35sWsubhpquR2PSy2ZefqWTbfyRkInkw/hqUGPBj
 ZXiZuBtWtw9NZ0z8sCagit3MbVY+gABSCNN1W2+CGe8RztCOdM0ZfKbE9nge2OUE9Xtl
 Yh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j7x+HLm2LEKBALh0UPyepB61DxgpkHAaYRV17vBSdzQ=;
 b=PROFXZpDI9Fnzn7p4hAQqgsyJCjEgK7jU4BD/Xdlzh0Via8aXpAXzfjt62J1fVpDrf
 tJr/RFnTAMjSRNoPUh/g4hc8QX4A9c7+71+vnY/wGjkHgGAJ3xv9hDpuXVgpzkQ/SkVu
 m/mVQLP8PEk6UtAU/a/pGkzLsOUMTKKznNKrmQJgHdy39MZfa/zSfKNMGBLLXFEx6Wbz
 qVIwGuoT8+lPvkcWNDES1j9BUlvxKfuwN7OFMIY9ObmzFS0kkumqjqkICO8luQGtShPb
 1jWhNR2DTkj0YYxrzjvtC2Y+x7tCf/HZHFVzfXNfiYMsQItrbNvsQnCvF4qkF+eqELle
 wRNw==
X-Gm-Message-State: ANoB5plR5ssPLvKFba6ohuMKZfvyuYxNjTH9/VwwVXwttLL2ArMhNn19
 k2itm+rQcVfl9Moml7nwHZI=
X-Google-Smtp-Source: AA0mqf5dEsnliFlI1CwrcavRnApjGqTrR4v9GqIcVx2YGXtn8RN6nl9Ksvz7lXTw7S/UBFDEbwwwzg==
X-Received: by 2002:a17:902:ea91:b0:189:6f76:9b60 with SMTP id
 x17-20020a170902ea9100b001896f769b60mr42532048plb.29.1671463920026; 
 Mon, 19 Dec 2022 07:32:00 -0800 (PST)
Received: from [192.168.1.34] ([110.226.149.155])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902a38f00b00178b6ccc8a0sm7315978pla.51.2022.12.19.07.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 07:31:59 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------D0J20Sb7Aeo4sYgE0KUZJLUZ"
Message-ID: <647aabf5-4875-8b32-c580-a95addabd977@gmail.com>
Date: Mon, 19 Dec 2022 21:01:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 0/2] Make ILI9486 driver working with 16-bits SPI
 controllers
Content-Language: en-US
To: neil.armstrong@linaro.org, Carlo Caione <ccaione@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
 <19de9bfc-2012-451d-f5d1-59a04ea9d813@linaro.org>
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
In-Reply-To: <19de9bfc-2012-451d-f5d1-59a04ea9d813@linaro.org>
X-Mailman-Approved-At: Tue, 20 Dec 2022 10:39:50 +0000
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------D0J20Sb7Aeo4sYgE0KUZJLUZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 19/12/22 19:13, Neil Armstrong wrote:
> Hi Kamlesh,
>
> On 19/12/2022 10:02, Carlo Caione wrote:
>> This patchset is trying to fix problems seen on S905X boards when 
>> interfacing
>> with an ILI9486 equipped SPI panel.
>
> I fully reviewed both patches, but I'd like a review from the maintainer,
> can you have a look ?
>
> Thanks,
> Neil
>
Please accept my apologies for not reviewing for long time.
I do read mails, but couldn't reply because of broken inline reply setup.

There are actually many displays using ili9486, with all having some minute
differences. Waveshare has two version A and B for 3.5 inch LCDs both 
with ili9486.
The B version needs different initialization sequence and there are few 
from other vendors.
I have got few mails directly, that the lcd with ili9486 is not working 
with this driver,
the conclusion is always the slight difference in hardware and thus 
slight change in driver to get it
working

My point is, if this patchset doesn't break the existing setup, we are 
good to go.

Both patches look good to me.

Reviewed-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>

...

Regards,
Kamlesh

--------------D0J20Sb7Aeo4sYgE0KUZJLUZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19/12/22 19:13, Neil Armstrong
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:19de9bfc-2012-451d-f5d1-59a04ea9d813@linaro.org">Hi
      Kamlesh,
      <br>
      <br>
      On 19/12/2022 10:02, Carlo Caione wrote:
      <br>
      <blockquote type="cite">This patchset is trying to fix problems
        seen on S905X boards when interfacing
        <br>
        with an ILI9486 equipped SPI panel.
        <br>
      </blockquote>
      <br>
      I fully reviewed both patches, but I'd like a review from the
      maintainer,
      <br>
      can you have a look ?
      <br>
      <br>
      Thanks,
      <br>
      Neil
      <br>
      <br>
    </blockquote>
    <p>Please accept my apologies for not reviewing for long time.<br>
      I do read mails, but couldn't reply because of broken inline reply
      setup.<br>
    </p>
    <p id="b">There are actually many displays using ili9486, with all
      having some minute<br>
      differences. Waveshare has two version A and B for 3.5 inch LCDs
      both with ili9486.<br>
      The B version needs different initialization sequence and there
      are few from other vendors.<br>
      I have got few mails directly, that the lcd with ili9486 is not
      working with this driver,<br>
      the conclusion is always the slight difference in hardware and
      thus slight change in driver to get it<br>
      working<br>
      <br>
      My point is, if this patchset doesn't break the existing setup, we
      are good to go.<br>
      <br>
      Both patches look good to me.<br>
    </p>
    <p>Reviewed-by: Kamlesh Gurudasani
      <a class="moz-txt-link-rfc2396E" href="mailto:kamlesh.gurudasani@gmail.com">&lt;kamlesh.gurudasani@gmail.com&gt;</a>
    </p>
    ...
    <p class="moz-signature" cols="72">Regards,
      <br>
      Kamlesh</p>
  </body>
</html>

--------------D0J20Sb7Aeo4sYgE0KUZJLUZ--
