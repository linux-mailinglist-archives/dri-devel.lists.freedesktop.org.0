Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F31E39F2F4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84866EB98;
	Tue,  8 Jun 2021 09:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C2D6EB9F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:54:28 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 539C782E68;
 Tue,  8 Jun 2021 11:54:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623146067;
 bh=EBIkRrWsGIQPOAMGyeBmTGCu/4WXtQAoiinQNtLEOBk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YEb6ZxdgoKaqjMB3x1uWrS//gyQia15YR2BwVMcmTrSTW9QGdccsxI+sc1xWb5JUS
 EP0iFS0qo1LrRlpWOpZHvhkh2AUeaNew1+vi0u4m6lICC2WbutroKZaglLVKhQ5V4x
 fScMz1dAY2Tu3aPd76UKeEB42I/UvgBJncTYaOUxuAHC7ZK/qz/jXk8bWygN1i+5ub
 3lm+fKqToRiWbljZZA50mCRv7z76y5rh/5Z2r30tg5IMyxkZokGnfwE2rxXtxBEcgQ
 igc6hSuQFM5S6VbOpcjdHClr9+FDtGJNEsdrAr+c+996EI9twZRSUWYXTHHFORhipA
 LTjueqr2A6Xuw==
Subject: Re: [PATCH V6 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Robert Foss <robert.foss@linaro.org>
References: <20210607174258.16300-1-marex@denx.de>
 <20210607174258.16300-2-marex@denx.de>
 <8376707f-7234-4555-a892-0581fee00908@baylibre.com>
 <CAG3jFys9F5Nt5cTEUKF7yaMAL5pyW6Kn73h4P2SDFhiBDb6pRg@mail.gmail.com>
 <c518ba40-31d4-7418-b921-577388af3acc@denx.de>
 <CAG3jFyvCxfzK1UrgapDZvota-DFmmuowaiBoLOXB_y2Gb2-1GA@mail.gmail.com>
 <CAG3jFyuQj1v9PAx9Ois3ypL+XhMRcCuuku5ssP2xD5jmWEGujw@mail.gmail.com>
 <b4328f63-fff6-0198-e369-2c87799e1e03@denx.de>
 <CAG3jFyuqZaMqmPtE5z3iDNHWeZwOn0i61FYNxMSEY=wgy4MCZg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <6358585a-b254-ee3a-cdcd-5b3acf0a1387@denx.de>
Date: Tue, 8 Jun 2021 11:54:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFyuqZaMqmPtE5z3iDNHWeZwOn0i61FYNxMSEY=wgy4MCZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Neil Armstrong <narmstrong@baylibre.com>, Adam Ford <aford173@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/8/21 11:45 AM, Robert Foss wrote:
> On Tue, 8 Jun 2021 at 11:45, Marek Vasut <marex@denx.de> wrote:
>>
>> On 6/8/21 11:44 AM, Robert Foss wrote:
>>> Pushed to drm-misc-next.
>>>
>>> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=db2aad0ffa7dfec31ddf715017a6ae57aa162045
>>
>> Well, then I'll just send a follow up patch.
> 
> Thank you!

See
[PATCH] drm/bridge: ti-sn65dsi83: Fix checkpatch --strict CHECKs
posted to dri-devel
