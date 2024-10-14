Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1108E99D8E2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 23:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E3910E4D2;
	Mon, 14 Oct 2024 21:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="lIv64s39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615DA10E4D2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 21:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1728940614; x=1729545414; i=wahrenst@gmx.net;
 bh=S7RIjL7l608kr10EKJod1atr94lXMVG7hjN31XMFk4s=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lIv64s39+AlzfDa9juEGtS9pRXPN9B/SZqr7cmD0+TVtUTGW9aK/oYkmMMSyJIU3
 63tU9c6mNBh4h+PzJiXO5de9ed54RhTUC2XGYMsTzHurLhbF0Dk+8Tq6nmtDyIvBi
 xSS86SUWj6ro5tPmEIgUsKkFZC8kEqN3i7dDPy1e468zbyX/n5z6iltn8hSbtw9fe
 1vYiyyvwbkTowYiakXm5rc2LS2Y0tM3RuRPrvhtBOwxTzY/nVFmXpIlopQzU6Ued3
 hVc4xyPrdVhgeh/agF6MuRhokc9RRcrcKE4xRBCG2s1zRQyKhWkIu3WNdgiKfuwZM
 /pPVEep3hxzQxtNt5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzhnH-1tvKRr18JV-00zFSH; Mon, 14
 Oct 2024 23:16:54 +0200
Message-ID: <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
Date: Mon, 14 Oct 2024 23:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net>
 <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
 <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GI9WaddBO8+MyMlwQodyw5G8HpzdEaHjrD9gDSYsff4+K+geQIV
 5gT1MD+pCjtKJtB0X3/NkTFQKUxqaz5bZWtJULkByXiGDpG2SOH1iwvVR1SxLfkLny0vK5A
 ++ybCGMjmvPi25nJlYiGvOuejyzXCuf0/hGGQXKq5RwfWUQoF58Uv7kg2t1GjY6vvnTGH3b
 7IxsRRFjdoRHT+xaxLV0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1jKouSN5DRo=;cMFZ38qki7vzdx1jtP/wk1rjAOQ
 jxul6dqaoFSxPXPuZfJCXgbFDMT4XPw4kJxjqdJaVWN4OfbtH4FLwb+lgcbBT4XI62qRBhLx5
 0kB8gZIJ1MVbcQvjiic8VC/PBdPnIBCfPigsQu82f0v3/yIZPxk5NFCPd5z84//lw7TDFuull
 E5ntcUwl6P0r2rsKi33z7H1j3mPyqrbZ12INdOCuaG51AczaqG61LLJ0OIWKbp2BPZXpExmuM
 4jvqz4n1xkG3Jd9/BAAVkHgRVg3bgj7gDwsPFvnFIYLX8GzLOyLlB1QcPzgCUar/1Po2jOj6r
 8scRLYKeoDk/yfZPVICsLq8v0v5JbGJf1oYWMoN27RdyoRdeYSDv2HqMwqCctw3z/gRZ0weRk
 n+FEueW+U2G2kCxquTePYFnc1eUXDpeNYQLJO/f5/oEyNaZ46ehRo8nEc8m89Uv2fze/bc+Zn
 LT/LJu00+/HZAYaRr4l5bav04OHrUfRPHuLocRHvGcL/duUbRWYOam09iOH9MMyrtvy+ab1nb
 sm1QVFjOKruHywRekavRbmlQJgPWceNx0GdqY9+zYBRW1gyVSTkIXPixjXJVGNGqfwBBvga/n
 gkBWbss2YglRQFMFtkab0xmzcrzMIHLogkIPjDzAwr00mQVQ4boRftpU5jgAaeLJM0cKzgzKA
 RfwLnxv0WYCoBXZO7Qq2u6bu4jrQUvOfP9KITHETFDbMg2HVlJQJTEsVHzwiZ3BJ+cZbpIbuu
 +0tPy08fyirzIAdEcLfeZsG+FSBwTkbZxSF7xriMAzm5/MFNCzcfe8caLW6g1M2z1KWwV0pWr
 dUkZiaWG2GT1TvxntIVDglZw==
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


Am 14.10.24 um 12:54 schrieb Dave Stevenson:
> On Mon, 14 Oct 2024 at 10:04, Maxime Ripard <mripard@kernel.org> wrote:
>> Hi,
>>
>> On Sun, Oct 13, 2024 at 09:57:58PM GMT, Stefan Wahren wrote:
>>> Am 13.10.24 um 21:11 schrieb Dave Stevenson:
>>>> Hi Stefan.
>>>>
>>>> On Sun, 13 Oct 2024, 18:19 Stefan Wahren, <wahrenst@gmx.net> wrote:
>>>>
>>>>      Hi,
>>>>
>>>>      i recently switch for my suspend2idle tests from Raspberry Pi Bu=
llseye
>>>>      to Bookworm. After that testing suspend2idle shows a new warning
>>>>      which i
>>>>      never saw before:
>>>>
>>>>      HDMI Sink doesn't support RGB, something's wrong.
>>>>
>>>>
>>>> Can you provide the edid of your display please?
...
>>>
>>>
>>> The failure is coming from sink_supports_format_bpc()[1], but the flag
>>> for DRM_COLOR_FORMAT_RGB444 should have been set from
>>> update_display_info()[2] parsing the EDID.
>>>
>>> Loading that EDID in via drm.edid_firmware has given me a console at
>>> 1920x1200@60 without any issues, so I'm a little confused as to what
>>> is going on.
Since this warning only occurs on resume and not during normal boot, i
would assume there is no issue with EDID. Maybe the flag get lost. I
should have mention that X11 doesn't recover in this case and the
display stays black.
>>>
>>>    Dave
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/gpu/drm/=
display/drm_hdmi_state_helper.c#L130
>>> [2] https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/gpu/drm/=
drm_edid.c#L6669

