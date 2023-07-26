Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7BA7634FB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 13:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7874B10E463;
	Wed, 26 Jul 2023 11:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7137310E463
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:31:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id BB3095C0048;
 Wed, 26 Jul 2023 07:31:12 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Wed, 26 Jul 2023 07:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1690371072; x=1690457472; bh=tN1tOIi6LgdYyNWu0Imw1ahtdb+2EI1lLQO
 E3uE4dcc=; b=Ism7zxqTNnubAG9Mfl1QlpNd6eWjoLk9spt6HFx1cFQEvWbxHZ0
 pWaDXHKpVLqv9lVvUq8w4piGVIEu3BJBgCjCKIYPWYXzKvx49RCmFfO6ICOJ4Mc3
 Tnd0GGh3ACh9POkx77WZapoXhspzHZLn6Wcplo1wXYU8nECgs1Ds0rFsuL49Vjzv
 bhiveCvKJCxn3FHqBo2XLbTY6uZ7pLlUdadR076rN39BAaFklLT5C7ylDziEB9b1
 64pcTA2x8DQpmYCKMoKYoOryD7QvpCp9v9S+X++ZvcBbSW/YUIYK6D5eSduCD+hL
 eUB/K5xeFLtZYlPPeiecnQvgGrk4wn6WWgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1690371072; x=1690457472; bh=tN1tOIi6LgdYyNWu0Imw1ahtdb+2EI1lLQO
 E3uE4dcc=; b=uboAnPfNz52PjzqONL4HLHIXmaOmMFmFmVTHgg+VS7n1nfglMFZ
 zSezRUf3ny96xibiLrFvbiNokE6GXOSTECb8VbUv0Tq13Knq6Q7n3R6P15+7nv5a
 fyDIQ4py9vTgCKKg/1jksqbsSzFG3n3dltAqPqfZjJMirqYYp9VBp7sD65CEnrqI
 ttkzG5i/RBU+xg5YMTODg2pjG756wrgaoQnmcXAYOOGbwZhtKad9Uf0MCaqIEsGf
 3R4Gy8dzM4CuJl+O9IKK/4VV3l5AV2KbnuakD59goVdvQoGkuFT0Q+hRFuCW3Add
 j9gS1HusT+dP76MQ3/JdIBoc/Rpk4C/rbEQ==
X-ME-Sender: <xms:_wPBZJQhXjP4Fz86xB7PJx5HJW_XqyKWIWWotkfT4Tz7V1mW4Jh8kA>
 <xme:_wPBZCxgpQW9YqwIZJp46bxw7aQ9iq2h4cLbpcQPI4nmIjWojl4l_58vxW_dRM34R
 o-ab0fMXfdnHMVbL1E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedriedvgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:_wPBZO3SwcPgSkl1dGcsN-Qigog45LAmXoeTFT0H7gE2NFeh69n0Sw>
 <xmx:_wPBZBApZ7qQuNK2WUv4s3mfgCoF77jGujremOvvcnMajZESKT8gbw>
 <xmx:_wPBZCig1ANqFipFayWz3ssbk5_CiHmnQtSpp27Hpv2wfgasoK-wtQ>
 <xmx:AATBZNXQdRL4UJDvG0E_0kEicFpclUhkA3svPN0G1cg-N7axc6xENA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5799FB60089; Wed, 26 Jul 2023 07:31:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-592-ga9d4a09b4b-fm-defalarms-20230725.001-ga9d4a09b
Mime-Version: 1.0
Message-Id: <e2e5d376-a307-4ddc-bebb-5c00141dcc01@app.fastmail.com>
In-Reply-To: <20230726105436.h3kqtjzbhvjrg6kp@pengutronix.de>
References: <20230726100626.167490-1-wangzhu9@huawei.com>
 <20230726105436.h3kqtjzbhvjrg6kp@pengutronix.de>
Date: Wed, 26 Jul 2023 13:30:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Zhu Wang" <wangzhu9@huawei.com>
Subject: Re: [PATCH -next] drm/bridge: fix -Wunused-const-variable= warning
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, benjamin.mugnier@foss.st.com,
 Maxime Ripard <mripard@kernel.org>, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 duwe@suse.de, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Doug Anderson <dianders@chromium.org>, anarsoul@gmail.com,
 "laurent.pinchart" <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023, at 12:54, Uwe Kleine-K=C3=B6nig wrote:
> On Wed, Jul 26, 2023 at 06:06:26PM +0800, Zhu Wang wrote:
>>
>> Fixes: 5d97408e0d70 ("drm/bridge: move ANA78xx driver to analogix sub=
directory")

This is the wrong commit, the driver was just in a different place
before that, and the bug was already present in commit 0647e7dd3f7ab
("drm/bridge: Add Analogix anx78xx support").

>> =20
>> +#if IS_ENABLED(CONFIG_OF)
>>  static const u8 anx7808_i2c_addresses[] =3D {
>>  	[I2C_IDX_TX_P0] =3D 0x78,
>>  	[I2C_IDX_TX_P1] =3D 0x7a,
>> @@ -52,6 +53,7 @@ static const u8 anx781x_i2c_addresses[] =3D {
>>  	[I2C_IDX_RX_P0] =3D 0x7e,
>>  	[I2C_IDX_RX_P1] =3D 0x80,
>>  };
>> +#endif
>
> You can mark anx7808_i2c_addresses with __maybe_unused, then the #if
> isn't needed.

Neither of these should be needed, as the driver only works with
CONFIG_OF anyway.

>>  struct anx78xx_platform_data {
>>  	struct regulator *dvdd10;
>> @@ -1387,7 +1389,9 @@ MODULE_DEVICE_TABLE(of, anx78xx_match_table);
>>  static struct i2c_driver anx78xx_driver =3D {
>>  	.driver =3D {
>>  		   .name =3D "anx7814",
>> +#if IS_ENABLED(CONFIG_OF)
>>  		   .of_match_table =3D of_match_ptr(anx78xx_match_table),
>> +#endif
>
> If CONFIG_OF is disabled of_match_ptr(something) evaluates to NULL, so
> you can drop the #if here.
>
> Having said that the better fix is probably to just do
>
> 	.of_match_table =3D anx78xx_match_table,
>
> as systems using ACPI can benefit from the of_match_table, too.
> See b89a9e9890d4 ("gpio: aggregator: Remove CONFIG_OF and of_match_ptr=
()
> protections") for an example.

Agreed, removing the #ifdef checks and the of_match_ptr()
wrapper is the right solution here. I see similar things
in other bridge drivers that could be changed at the same
time:

$ git grep of_match_ptr drivers/gpu/drm/bridge/
drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:                .of_m=
atch_table =3D of_match_ptr(anx6345_match_table),
drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:                .of_m=
atch_table =3D of_match_ptr(anx78xx_match_table),
drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:            .of_matc=
h_table =3D of_match_ptr(mhdp_ids),
drivers/gpu/drm/bridge/chrontel-ch7033.c:               .of_match_table =
=3D of_match_ptr(ch7033_dt_ids),
drivers/gpu/drm/bridge/sil-sii8620.c:           .of_match_table =3D of_m=
atch_ptr(sii8620_dt_match),
drivers/gpu/drm/bridge/ti-tfp410.c:             .of_match_table =3D of_m=
atch_ptr(tfp410_match),

The other ones are even worse because they use of_match_ptr()
without the corresponding #ifdef around the match table, so
the of_match_ptr() does not even have the effect of saving a few
bytes of .data segment.

     Arnd
