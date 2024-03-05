Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E28719E8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541D710E214;
	Tue,  5 Mar 2024 09:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lFsPXPEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC9810E214
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 09:48:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 472B91BF206;
 Tue,  5 Mar 2024 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709632137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aw8pUe0MID70y933FGi7D+L6M1sIf5ieS9mZ3leciLE=;
 b=lFsPXPEfA66AsRtfkm2k0eqMO8n1R78NnQCu16rwl0rxXnz1zd7Ic+aZQlxddbzIuTyf/Z
 Ievu/+b86nO9T9w2JTRIBH6c5r4NWv9f81PuuHn8L7qIYblvipiPu/xvJ6HcSdpHD4ynLT
 847BOix813JmNH1STAadsZNqxyNrLOF4IEvjnLvGZcHH5JQi1n5e9wEGQQZYRbF0Z54+Ci
 iz9i9HwLa8j19Ll+bHlEt0JJ1eRRjLabj5lad2uNs6msYLDYsqNHrBSwWxTlZOl2voOCar
 igBw08xlhiqKo4lNiZijWksSW9MsrTOmnYq/1+58thF/v47Jm406t0GV90eIPw==
Message-ID: <5c3acbaa-dc95-4f8a-87cf-c62b6ccc442c@bootlin.com>
Date: Tue, 5 Mar 2024 10:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] panel-simple: add support for Crystal Clear
 CMT430B19N00
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>
References: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
 <20240304-drivable-property-feaeba782880@spud>
From: =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?=
 <jeremie.dautheribes@bootlin.com>
In-Reply-To: <20240304-drivable-property-feaeba782880@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeremie.dautheribes@bootlin.com
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

Hi Conor,

On 04/03/2024 20:29, Conor Dooley wrote:
> On Mon, Mar 04, 2024 at 05:04:51PM +0100, Jérémie Dautheribes wrote:
>> Hello everyone,
>>
>> This patch series add support for the Crystal Clear Technology
>> CMT430B19N00 4.3" 480x272 TFT-LCD panel.
>> It also adds Crystal Clear Technology to vendor-prefixes.yaml.
>>
>> Please note that unfortunately there is no public datasheet available
>> for this panel.
>>
>> Changes in v2:
>>    - add link to the Crystal Clear Technology website in commit message, as
>>    suggested by Conor Dooley and Neil Armstrong.
> 
> You forgot however to add the acks that I gave you for the two
> dt-binding patches.


Oops you are right, I'm sorry. Should I send a v3 containing these acks?

Best regards,

Jérémie
