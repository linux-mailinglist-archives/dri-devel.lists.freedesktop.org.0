Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F3F9D934A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1792310E7E5;
	Tue, 26 Nov 2024 08:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="V+fb9rR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 80846 seconds by postgrey-1.36 at gabe;
 Mon, 25 Nov 2024 18:25:53 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D382410E044
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 18:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oldschoolsolutions.biz; s=s1-ionos; t=1732559142; x=1733163942;
 i=jens.glathe@oldschoolsolutions.biz;
 bh=gnJiQRYs6QwmyqD9t2RNLsEiCy/YJhARjRjeHI7aWpo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=V+fb9rR4eT/zil4UO85X+FdYI//rfxwm0lGPi3vY95ZB1iXZBV/XkdGaoLJF4T/s
 6g3jnHxfVa1a+mv9s4WkpWGHIhCJCE81A8ATYIw9BnSH4chjoKqt+EvczhkU0FlNQ
 O0DAQFqn4UmaDtd1aNEvZ8LAMsGlxHcOJ9nbu75rLebSBcUltwarhBW1mE0N0M+5Q
 4HEs0hZSg61xmMPrEqqdr8erLc+p9pXgzg1eYM4+9Ap8mVy2yU9wJWLoA94mrQxfA
 xI8R3BLZTUl38MQwUHf+/uAdZUYPMeOM0NycQhP59Lvhkq08Y7BtiwJpWyPpxRS/j
 Ginpsz5RCVpW2nOqTA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.128] ([84.175.94.57]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N0nOF-1tad4i38WD-014thg; Mon, 25 Nov 2024 19:25:41 +0100
Message-ID: <562bdcfd-1595-422a-884b-09c36db72737@oldschoolsolutions.biz>
Date: Mon, 25 Nov 2024 19:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/panel-edp: Add unknown BOE panel for HP Omnibook
 X14
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
 <20241124-hp-omnibook-x14-v1-3-e4262f0254fa@oldschoolsolutions.biz>
 <CAD=FV=V2JhWsK4-gHL72ttXdNA0U2p6YojN+DXtWxNSOjD-ZSw@mail.gmail.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <CAD=FV=V2JhWsK4-gHL72ttXdNA0U2p6YojN+DXtWxNSOjD-ZSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4Rp+He4zRJWJsM20vMzGBIK+m1xvgdFn8GRdJEwqYwor5a0x0dT
 muFVYQg/AFDhGZylCTr83u0vV58aHi/Q3SEz7ZVVyqVgYY3ij1MCenKds50zoZ3eWdkj0mA
 +yCxQEY0braBwijbRkEbHVu8xnerxqkGM/WA7l8NOKTvkj3yBkRW7IKyOHA2MMhKhUm8PoC
 OZsMOlHf2ohZZquptc2CA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8KEe4BwZgHc=;SrygARVp18+lY13wHswfUUk65K2
 8kxMuFps+8ihGqdUYmymd7aUHAZUZJGm/PdDBJRTohtlHhpWKY1sbSSnQXR7W5hLzofaTZB1v
 kKjm7NGwvL7tbeXeLZJ+xxrMnD4gwcZi+URxGsYEoKxMQUKR1TUaEn7o9zCjEzrdHNyAmMdsU
 bQXe/j0tprwt2+eDDRlMM9j1WzvG3xJWMVShin2PS9RIr3zqo4zz0y6T+k0EmO9UkppvqguZ7
 BEV7FUcIj1BS6mwsyII3mw3nu1W8MfVOVEGE7HhjKmct4xE5CAKfHRxOIBg2QcX7awWmMuoEt
 hoquaFPZL6/7u6gAvzdkYMXKVXaig3ap4W8TOpi3uQFPhq0SH6rt4dFZVKHhWzsJhw7teUv8j
 /JG/gT6EneZypXrdVU2LfH6CLoDKWd5mI3bdS3Yyy8SOm7Rj4s9xGLO1+3N4CPDuCfXEqSS4U
 PAoNV58q7vxuzKAfdNoeXOy1PokicTdxfOtUbIOpilYAyfpuIMGB5vwAf7xssb3MI0TmOsSdi
 3OL5Oka+M4BASrpxoVgEaYWLx+6DLEwBfxSWifoZSy9jwTl87bIvLw8DPF8ui8dHHmaQavnj7
 s0rAlPUlJInlQaPZT9sFuIVziuuIjJlUjfNA96h7ApWKiPAKXaUpGYo09TzNAUZYEd2GbMdaQ
 LrlpThNvMJQLzNn+PBgov3oJGAH5wsrPFwe4508fVlGiSH+FnpxGksrPxIP0rII9PZN5aOaOA
 TWaLKt52xBe2y+uk96yW/6Gcy8+y2SnCzxWrjn6fSkeGtQvjNaTkzBz7d6lTXR7RFU+jNwqkg
 dGrgUOZjoQVvFlhpSfVCJokLj5h8FPbayqwZ/VttFkeObnKZDtVwcn5nqzs84ZJI/X
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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

Hi Doug,

On 25.11.24 18:53, Doug Anderson wrote:
> Hi,
>
> On Sun, Nov 24, 2024 at 5:20=E2=80=AFAM Jens Glathe via B4 Relay
> <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> [...]
>>
>> There are no timings in it, sadly.
> Yeah, and like other BOE panels also no model info in the EDID. Sigh.
> I guess "Unknown" it is until someone can officially add it.
>
>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>>   drivers/gpu/drm/panel/panel-edp.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
>> index 8566e9cf2f82a..403679e506fa4 100644
>> --- a/drivers/gpu/drm/panel/panel-edp.c
>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>> @@ -1915,6 +1915,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>>          EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT=
140FHM-N47"),
>>          EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "N=
T116WHM-N44"),
>>          EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV=
116WHM-A4D"),
>> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Un=
known"),
> This is sorted incorrectly. I'll fix it for you this time while
> applying, but in the future make sure you sort numerically. 0x0c93
> should be before 0x0cb6.
>
Thank you, haven't seen it. I would have reordered it in V2, but now it
stays that way. Yay!

with best regards

Jens

> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Pushed to drm-misc-next:
>
> [3/4] drm/panel-edp: Add unknown BOE panel for HP Omnibook X14
>        commit: c1bae6802ee9c8ad8e3c1df7ca3174d6b4b260e5
