Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F658C220B
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 12:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551B110E6D0;
	Fri, 10 May 2024 10:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="SLY6F6B2";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="AZhLmQsf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com
 [103.168.172.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982F010E6D0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 10:24:58 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 7EC2F13823D7;
 Fri, 10 May 2024 06:24:57 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Fri, 10 May 2024 06:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1715336697; x=1715423097; bh=RV16UsPZ7k
 HshFR9q+mGzDhSzK0T5+eVMIdSnuqNlDU=; b=SLY6F6B2eaidYessQIvxF2HLgB
 s5090Pe5YP0hfdfqS7mU4pD4KRf+UJmfuGvKw2mvDarEa+r6MW3ep4N+DN5/FRLY
 TsPIh648rVXqnVqS+gnqVVyDObNseJ+DOKfMPdMqlXp0u8pxZKPEVi/uRSIOgwYt
 mBMT77GaRYkeOjSIp4biyAiC2sIfUPzbBvKU390EIK25fc9PXb0Adzy9jy7YSvGa
 YtejdqijxrzC6Jx6PQMsB0jaiSBfBnPjhQ8YZchnmui0vJP3hke0HjVxA5BTI+jH
 HbBy/J6nSAUjSIJyRXKAhT66t37U97M+itVI4jiMOmgc3Ma+Zw/zNx5S8JNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1715336697; x=1715423097; bh=RV16UsPZ7kHshFR9q+mGzDhSzK0T
 5+eVMIdSnuqNlDU=; b=AZhLmQsfDQlx2APbhbWtRxGvWE4UNrkDsaqZkx60eMBM
 g9xiKjc+F1veqBdQKO7Anf/2sale2wTw/GxFTlYyJ2Znw3JKqKR21UPbz+YAJanD
 yQJmIduuegPtg+c71XvS1qFYyR3mmlnTYsyWOuokqVwbYmshZcy5zuWfPdBOmxkR
 gxt+pcKCNmT+D5nT9/nVBDI2aD8GuVxLyiCTQ8I6NTa4349Etbpw7uuTcTi19wP0
 69BYC34wXcVDcQni/kR4BD36iHkR/9zCatefEE6oR3oGcRF59iWdDjlEzRiveQu3
 h/+FXvQXR86jyauFVzlCohImXL8OatFQFSbTznSDYQ==
X-ME-Sender: <xms:-PU9ZhYwWkgfbPa-0eshJpo0NtX7ukpQmbyKsFWhTUd9crgBTmu8Zw>
 <xme:-PU9ZoZZ2IVXIvk1H9CG9-BbpYgqEWMnZZ1_mADIFFMWR4IN87yP2p2jhfX-RMEm5
 E3e7xqY-ALhHaf66vc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefkedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:-PU9Zj_adBC4n-cN6QpAGMOdOrMC6WWZSQ3SHTRqvln6rXnYl1wutw>
 <xmx:-PU9ZvryzBZj14Z7L0XEk14GUgS-gXl7dumB6gfO7rZIBFkXZ-G3yg>
 <xmx:-PU9ZsrUS94Kkm4NOaj6bAMHOLZinAZuwKyjAp25QYHKZgXtt7KHNg>
 <xmx:-PU9ZlSylZ5GJdrLBsFgjN0XdKKkrYcbtf9_ml77vBZvC_z1R0S8Lg>
 <xmx:-fU9Zuh9E-TL5FOJZWXE-wKCh0cPkLp6ysPIriZDu4c4KPsnoWpN-mDV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B6FC3B60092; Fri, 10 May 2024 06:24:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
MIME-Version: 1.0
Message-Id: <a1970921-f00b-411d-832d-5289f9812ba0@app.fastmail.com>
In-Reply-To: <2024051039-decree-shrimp-45c6@gregkh>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-5-ec32f2c66d56@bootlin.com>
 <2024051039-decree-shrimp-45c6@gregkh>
Date: Fri, 10 May 2024 12:24:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,
 "laurent.pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Dave Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "derek.kiernan@amd.com" <derek.kiernan@amd.com>,
 "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>,
 "Saravana Kannan" <saravanak@google.com>,
 "Paul Kocialkowski" <contact@paulk.fr>,
 "Herve Codina" <herve.codina@bootlin.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Paul Kocialkowski" <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 5/5] misc: add ge-addon-connector driver
Content-Type: text/plain
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

On Fri, May 10, 2024, at 09:55, Greg Kroah-Hartman wrote:
> On Fri, May 10, 2024 at 09:10:41AM +0200, Luca Ceresoli wrote:
>>  
>> +config GE_SUNH_CONNECTOR
>> +	tristate "GE SUNH hotplug add-on connector"
>> +	depends on OF
>> +	select OF_OVERLAY
>> +	select FW_LOADER
>> +	select NVMEM
>> +	select DRM_HOTPLUG_BRIDGE
>
> Can these be depends instead of select?  'select' causes dependencies
> that are hard, if not almost impossible, to detect at times why
> something is being enabled.

I think FW_LOADER needs to be 'select' since it is normally
a hidden symbol and gets selected by its users, all the other
ones should be 'depends on'.

    Arnd
