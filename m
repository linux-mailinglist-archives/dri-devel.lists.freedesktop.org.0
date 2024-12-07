Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037309E7E8D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 07:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1F310E1D5;
	Sat,  7 Dec 2024 06:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0764910E1D5
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 06:30:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: from mail.steuer-voss.de (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id 5FDDF22D4;
 Sat,  7 Dec 2024 07:30:27 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 07 Dec 2024 07:30:27 +0100
From: Nikolaus Voss <nv@vosn.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Liu Ying
 <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Fabio
 Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, nikolaus.voss@haag-streit.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: bridge: fsl-ldb: fixup mode on freq mismatch
In-Reply-To: <87zfl8oqeg.fsf@bootlin.com>
References: <20241203191111.47B56F7@mail.steuer-voss.de>
 <87zfl8oqeg.fsf@bootlin.com>
User-Agent: Roundcube Webmail/1.5.0
Message-ID: <bb14f0aca5d14141b45700abf10deb61@vosn.de>
X-Sender: nv@vosn.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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

Hi Miquèl,

On 06.12.2024 15:08, Miquel Raynal wrote:
> On 03/12/2024 at 20:09:52 +01, Nikolaus Voss <nv@vosn.de> wrote:
> 
>> LDB clock has to be a fixed multiple of the pixel clock.
> 
> Not only, IIUC it also needs to be synchronized, ie. share the same
> source.
> 
>> As LDB and pixel clock are derived from different clock sources
>> (at least on imx8mp),
> 
> Wait, what? I am sorry but that is not at all recommended, both should
> come from video_pll1 which the de-facto versatile PLL to use, no? Am I
> missing something here?

No, I was wrong :-). I've corrected the log text in the v3.

-- 
Nikolaus Voss
