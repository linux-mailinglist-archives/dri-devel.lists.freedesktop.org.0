Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0065877364
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 19:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB2010F3C9;
	Sat,  9 Mar 2024 18:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ot8O/uBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8DF10F3C9
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 18:49:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 60B20CE018A;
 Sat,  9 Mar 2024 18:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EC7C433F1;
 Sat,  9 Mar 2024 18:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710010157;
 bh=9bI99ss4ph8pYgB5CSu4EuHp5g5VIpqdz+obqwKimsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ot8O/uBvwJkguWlXio3Nm5BvarTW++6E39bXet8Ubx9wZgeMc7JTQXBLlMO2aLZdS
 qDvyjnW4JHdPeTLNZcunI2HRN999hhVKGBHoSVvsi7RobTMykEsF3J2promiw7jqN3
 ONjNh/0Cbi+S74WoZ//Zr9w3io3xdg4Mp4/buU1t2ui+WhVNE6XbLtWvFFLXpCfVB5
 qm6vxMOrgNnfTxBK58O1IIIsVx377s7howQtS99ZLGxSBlyZG2lF/AmAXekR2cUY4v
 6Ub/paiHAkDcp69UAW2oqEEoqXEwBGsva1gSG0EjSYbcvAKn6kbPm0DQl+LcOq4yaA
 jq0A/bBD74fMA==
Received: by mercury (Postfix, from userid 1000)
 id 4F4911060B10; Sat,  9 Mar 2024 19:49:13 +0100 (CET)
Date: Sat, 9 Mar 2024 19:49:13 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Patrick Gansterer <paroga@paroga.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: Add Texas Instruments
 LM3509
Message-ID: <iuhmiozrfeepftq2hyvt3i6fcwgtllw7imex2tkxmvyrph6qmu@bpygt3i3awoh>
References: <20240308215617.1729664-1-paroga@paroga.com>
 <cb220c6f-086c-4995-b2e2-bce78b9a4b04@linaro.org>
 <f97b4a8e-7944-496d-9bed-20e8076a327b@paroga.com>
 <4f3cf3c2-c5ff-475b-af5b-3fb698325c60@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f3cf3c2-c5ff-475b-af5b-3fb698325c60@linaro.org>
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

On Sat, Mar 09, 2024 at 01:22:28PM +0100, Krzysztof Kozlowski wrote:
> LED strings are true in case of... well, LED strings, but I just
> wonder if such setup is applicable for backlight. Anyway, if you
> think it is, I don't mind.

LED strings are being used as backlight. Either from the edge, like
shown here:

https://en.wikipedia.org/wiki/File:IPod_Touch_2G_Backlight.JPG

or like this:

https://de.wikipedia.org/wiki/Datei:DiodyTV.jpg

Greetings,

-- Sebastian
