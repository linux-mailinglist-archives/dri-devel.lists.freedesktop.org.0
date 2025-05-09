Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA961AB1DA4
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 22:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940E010EACF;
	Fri,  9 May 2025 20:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="cvGzHL4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2044.outbound.protection.outlook.com [40.92.41.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE7610EACE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 20:03:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLHKsr7Ia5228YKBWb35zyzFM/Kkmh8fjTg/A/ddH6QkOqLHBWZ9rlA/YtA4o7t7+2ViWXnRRsFDlD3kwEMB7O07RmsESnA1v2fkI0NWNw5TOTppR3reFXNCG+OSZRSe09uuTzpKyRaueyPUXpIzimGIdA66sC5W5hHqBfhEjrZbDbPzM1gviCGYKkoZKkvK+1Q5fYPjltlYhvG/O4VLoWcHxvfMF0o5EL+w5eLoA9FsbBeMC5+HDKabG5ONgmfzL/ZJ588APEyUo9X/q3p8FpQqeIPABlrTge8fiFQmDkI3tS2pTrDmtGgrrr6efoLsAfQpMV+2QuuZzefD2BktGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okxTAMPbtwADR+K7ib7mFovnOeCFa+gscWuxVu/FdH8=;
 b=iC45k5OOXuVvYqhPUhR7Ac8TmOSzVG5VU3ts4HjpBpcLkg/Y5dpx1/AGnJ+nYPvrQQg2+Sgi29+M5o50yL6EhpdOhdL6HiuRvcGJDjJvHFt7VktD0CHZ8XY6cQNZGPLRDPRF5W8Lb+DvWwU+WS+HoqfDV9xA1DfWFEtz53Z1Gg/jgYfi+P21FZcps0piJMMVMxhxB4qpSJnxvBZ0qtVp/a7hazaVyPVs0RJO//6yPjAzY4EvehviMf4Zugi3YqQHQ/94YjINpQgvxkktgtssUx7O2X/v0Rdp46NnRsWTv/5yd9ptCh1Ce9swptZKy7R5Z0FYiL0vKYVOawbwiYVjHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okxTAMPbtwADR+K7ib7mFovnOeCFa+gscWuxVu/FdH8=;
 b=cvGzHL4AJ0NKRMW5YRnYQ2I+KnQAclnoVjxmIx5gjZlm2+zdEDjNNTRHCZ7vHKlV7LoVMj2f1v5zQTmhIkmtuQbRfxqTh0T0ZTz8wq2RX64jECyMY6rCgAsgBfy+MO9uPI2bvCZjvdDuVzVE5ztARKBLVfp954UsSjdyyWzUdZ6lPRHAYKIt0ifivgFzOohBHbABTG2qliJfMoe4HMjnP/CsJEHIoxbMZrlwfSp3XilGTycGV6hEbiuK2vpo9QhLRBgCtOhs96g7+76bay6wr3RNwm78Yh8BXyDJgsgQOE8BZ1SuvWqWh5UqFD/35To8pwQfJBGacKLjZ24HkQjG/Q==
Received: from DM6PR19MB3722.namprd19.prod.outlook.com (2603:10b6:5:205::25)
 by PH0PR19MB7319.namprd19.prod.outlook.com (2603:10b6:510:282::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 9 May
 2025 20:03:02 +0000
Received: from DM6PR19MB3722.namprd19.prod.outlook.com
 ([fe80::bcae:8341:5687:fb8c]) by DM6PR19MB3722.namprd19.prod.outlook.com
 ([fe80::bcae:8341:5687:fb8c%2]) with mapi id 15.20.8699.019; Fri, 9 May 2025
 20:03:02 +0000
Date: Fri, 9 May 2025 15:02:58 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, p.zabel@pengutronix.de, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH V9 23/24] arm64: dts: allwinner: rg35xx: Add GPIO
 backlight control
Message-ID: <DM6PR19MB3722DF3B3733E6409D83370FA58AA@DM6PR19MB3722.namprd19.prod.outlook.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
 <20250507201943.330111-24-macroalpha82@gmail.com>
 <20250509153204.05317413@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509153204.05317413@donnerap.manchester.arm.com>
X-ClientProxiedBy: DS7PR03CA0301.namprd03.prod.outlook.com (2603:10b6:8:2b::8)
 To DM6PR19MB3722.namprd19.prod.outlook.com
 (2603:10b6:5:205::25)
X-Microsoft-Original-Message-ID: <aB5fctcWfOHcOfMJ@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR19MB3722:EE_|PH0PR19MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: bab5b5be-3d59-4cff-c7a7-08dd8f34802c
X-MS-Exchange-SLBlob-MailProps: Z68gl6A5j28Dg8hDNbkP9M7l+NSvtbXKG8ea9qcYqfEqnSqNya5nyygahuDJw+zGdaJoAOnu9jslHbFbNkZxkMkfCFyM/3F0S9mSMzGpFWTAhVjYXmcxwVDGOkYTNeyS1yo5/KLTqbIXuBd3RWcQN1NePNwi9cG4uLD2e3UcMfpuMGMO53Yuphtd1hmOUE9QvM07+7VKsfIZFi8u0h4k2J0rRysH1HttFO6d8RwiEiq74HOPedZZKzB0BbBYSAQ0k08+jMuR5zyoGOUp+0iPkPzQ9dcqNRgtoB5+c7PPB7nTCHNc2iGnk+vzbH13Vl+twVaQKviV1Oi7FSOIXKWU0cqTVIuJw0Ht0E/ifQHKsOPX6i+oC6AsDTTc3FHhCiFUk+P6xdwy/OIsNgaDJD9+qObzQgifz27ccZKVVZhKN/191TWvMAyeKIpfciLgaruS8Gwfx3D+auvxvolMUDZWPERbnqcKvtp1FR1jar416Oo4whQdUdUj6I2A2swvVmsNFr6NRzOP1YR+tQNa8UORRLQfQaRHUTcoqCkTOCSYb3qifGmVfg2e36ONFVFKNA0yDoIUNFUTKLcRecVnFRi6M1s8TVoMBq3h95nY77bMvAir5g1KyPCXh+yImoNSWe+iZP11Cf7lVNpUq/TLDDj9JEkMCXnyNM1veeEhQ83LeE5Mbq9yKKH4V8e3YhyxDZIAWuR/hj7vdJT3ij6WoEwbMCNZJObhMXAMixfULt45LXF49nWnfXxu9hd1S+WoIY1Wl3iDz/ASIuhm15Jla336GPxRof+EqwnM+YtP85u/A04IonwzattWvvhELD3UKr8G
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6090799003|461199028|5072599009|7092599006|8060799009|19110799006|15080799009|41001999006|440099028|4302099013|3412199025|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J4Q+a9xpVK+ziKJx5/UsuAf2iNiU3hQSz8hJsVCQ3gb9e1hDnWe1XXoS5n/V?=
 =?us-ascii?Q?05vrOSQLaDKpC2FRvygrFmi7PRPas3PPCIgkCNkqf3BjgsOANxchoi93YZ44?=
 =?us-ascii?Q?al4oX8qybsDXMqjhMKB9ZLvPM4d83hSWbarYqBT9O9i6uvkKM6+dDTgHRwds?=
 =?us-ascii?Q?Jb7FNtd7Z4U+7TA+vpjxHaGU3bwcP3bgqW0a5p8F4poS7RdmlEgbur3wyLhp?=
 =?us-ascii?Q?vTq0l1qRLuzVQ/RuPwQvx2l+ZoprT1P2xNQ4mwHwbU1ytHO6c4pEgiSKBiLq?=
 =?us-ascii?Q?vDinr9pl08p7ECVYs/lvTTeq611Maz4Sy9oNSMtnv0BGkf5LmwhILy9IxdPV?=
 =?us-ascii?Q?Yj8NQKUAwttiu63kovlglU0SbKExW/ie2OLGLFFYAtalbb1owWCRb/FPTCU9?=
 =?us-ascii?Q?NPPBbLHWGiQNoYVXIc9RPgxnYeUC2j4VhGR4FGB/6RdyUF3W5ps4Hbdu80U8?=
 =?us-ascii?Q?iIxXmPbcwmTXWZpQCLB3CcKwl4HVryGhc1UVEgiuM//YMrHdAlqbe/Cmj9S2?=
 =?us-ascii?Q?5xevIu8cDfvwBFJXY0aUCnVZAE5u07W65FzuP3sCei8SbXFDm9OW+8ZWJMwC?=
 =?us-ascii?Q?b6rUMmvG2wc6xpMxHqPsU9pnST6CPsDoDuUKw0HxcIs9VeET+LSzhWyqTiIz?=
 =?us-ascii?Q?AMTQ9sGSPjuqlRNUQ9yOojjo2KaaTE+lSqyRdpltwPa/YHzPX4rNfSi1QWmH?=
 =?us-ascii?Q?NCZwVK1UMLrzHZiKTUHBXxcOIjjHg/rbPUnIxrwmkF3UCKLjDciSEKsJQCBg?=
 =?us-ascii?Q?AoGkorLQBlSkgtuyEnWQqnG+SQxfWxaQJrdISXsTxiQb1czZldenBosoKMZw?=
 =?us-ascii?Q?BbCLjdCk/Nw8jo3Xb6Ukhhrf06yuF/zMWw7SNND3Y5tn0Dn9m9rDymrPpJCY?=
 =?us-ascii?Q?7qF0/yPIE3BPohgd2xdyE7SGaCntSEAL/s29APSLfxzT1v6BlqJ193ZXZh8X?=
 =?us-ascii?Q?vVhYu09ML5KkrwcxnhrsWbAp1nDKrDDxu9JV4sKpztBQUBW/cj6vPXom0UXq?=
 =?us-ascii?Q?4TXvulOLK+yZZ2NAJA7u8sCdKqWJXMNOHTJEF+TUnnc+ij2vXwi96O6ajaRh?=
 =?us-ascii?Q?Auo3htgiM5sCj3ynbYIiFmH9VfnB3oTL8gIfr8YlwDx93K/ycdtCVV8c5ZMv?=
 =?us-ascii?Q?Qu71X+vwbLHXN3tyxNmfhwPT32PHuksCb+bZKLMaiEbeni7u6CQSK8U+0flt?=
 =?us-ascii?Q?Md4Aiv8BbUPr1lwQ7org5/i1KPPxIlPVZXSJWu1t4S3WhVaVHZ0nKG0Ba5/i?=
 =?us-ascii?Q?G6pb7Te4vunMo+Elgx+vW4ocfJK4Iz2Nm5y0jdJnGB46o7gFzMSRnuUcjZHq?=
 =?us-ascii?Q?C4Iu+/ljenrRCMRVaEmYDsgK7wBQd0fGRorxnBEXaPuhvw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o7dOO5+eSup8lH24NghwY410ogaQskgPqKeKP4V/0kWPcmFtOcq/a7Wltk/k?=
 =?us-ascii?Q?Vm2Sh+gKkYKdFYmBYTnEGuHwav5tZznNbzww4bCi6Fp2ZjVRQENmIgvxVJe1?=
 =?us-ascii?Q?ifY2lS7xDN08PCHo8wHRbYeYzUgJ4d1SZcKUeKkHFOsDrp4tFUY6bS8kir8I?=
 =?us-ascii?Q?wNktQ12B1W8EZLqp+uR5gO9aq+2Ctbu/XiZQYh3JDVbkwVjFCb9TPeOr/EwV?=
 =?us-ascii?Q?iMZFU+jAbQEVn2lEgpzSWQcwkg26FBd+1AkCdBt/5f9arvwJHzXx9QukBGOH?=
 =?us-ascii?Q?FQ4Kr8P5rEVReHXhi+FkpkCI7ADtPS+/sKNiHVQXLQwH1GnlsfaC9MrepZ90?=
 =?us-ascii?Q?HzKcr+Odilwa+khh3JyFHSoDHVg2RrY47Z5itU1lZ/wyH72JBYt+/qQ32zmp?=
 =?us-ascii?Q?Leme9WdAciCm/wGiLJJd8xtx7W28n514HsPVCd2oNkIMq9ACHHS6m9I0Etub?=
 =?us-ascii?Q?BDMoLe2ieYTG1UY2o8sydW6P7RJ5UjWu8I1mH7OjAUaT6a7yJ/wJ8NF5n99r?=
 =?us-ascii?Q?Gkt/2mOihq6Tmc+iJhDQRWiRko42K1yk5w5bPa9oIHNBIodJauH4ENU9QyKr?=
 =?us-ascii?Q?kjfENG8HpfcGax+LfrgyCawosTo1ZopsP3lNxz4vShxEwFtZNQiBklmfFlrS?=
 =?us-ascii?Q?o8Scln1gdlfaPlkZ7lpi8f9QQrk0iA3n4D3UWBFFUM6eO96S4bwcMh+KfP8S?=
 =?us-ascii?Q?AhzVeEBcakWUpDANvT4Evit/J9oNl7R30o2E1oTIr+1Qz5t9VaGNssiDw+8G?=
 =?us-ascii?Q?0EHQrScdzl+NVvPqWhDdslthlWGnZ+J40FQJOpE3dlRePPD/hYsym7vFlzgP?=
 =?us-ascii?Q?do9laC1gV5qvN7B37P4hWAzkVlBUO8KyiPXEyIzPTTNRy1cbTbngbU3itCBr?=
 =?us-ascii?Q?KKhsX4Rmp/dEt87edU5EMqMI1n9O9RFQTPeVKMcP6i1NfTg1TyHS0Q6mV/cO?=
 =?us-ascii?Q?CjcsxfAxTEkx2fsQqdnuXVi0TqTzbHK+Zpw2H7w82o7nZD5Bp4xeA+qsMooO?=
 =?us-ascii?Q?lSwE7CH+HK/VKPPTUcF24f5rK+8Vg2F0CABdgIDdFE/mxvcoqbcesVYa6ooB?=
 =?us-ascii?Q?xRq8+Y5O6jqHmQz5OyuCtn1piRNlZLb42sEMBF23mdqcZmOgp+r2T2yVyqfd?=
 =?us-ascii?Q?k5fqATB/S6VkHIad547GS2PGHszIP/Dz1Zo8exZXpd6zIg/AG6KlEqMnXvXB?=
 =?us-ascii?Q?RYQFz1zByqk4TEUlxQSBfKLBuX6hBiyN7waEFUcokOtelyO0FZUmoaXCXE9h?=
 =?us-ascii?Q?NIhDiJEBD/sOlIIrOljAEhQ7dGtt08mkFf0TyELUtAMhPXnuj1m4Aeq6kI39?=
 =?us-ascii?Q?nKdeHCTK/pYGCCtWPEnaR0Jz?=
X-OriginatorOrg: sct-15-20-7741-18-msonline-outlook-c907d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bab5b5be-3d59-4cff-c7a7-08dd8f34802c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3722.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 20:03:02.3563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB7319
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

On Fri, May 09, 2025 at 03:32:04PM +0100, Andre Przywara wrote:
> On Wed,  7 May 2025 15:19:42 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> Hi Chris,
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > The LCD backlight for this device can be exposed as a simple GPIO-
> > controlled device. It would be more accurately modelled using PWM to
> > enable brightness control, however the PWM driver design for the H616 is
> > not yet upstreamed.
> 
> I don't think this is right then: First there should be no notion of a
> "driver being upstreamed" in a *DT* patch, as "the driver" is a Linux
> speciality, which the DT itself doesn't care about.
> And secondly we should not chicken out and go with an interim solution.
> 
> So I guess we need to wait for the PWM binding to appear.
> 
> Cheers,
> Andre

Okay, so then I can drop the backlight (and might as well drop the
LCD bindings as well) until the PWM is upstreamed. I just figured
"something" for now is okay, but we can wait.

This is the specific series I'm tracking [1]... adding support for the
H616 would just require a little bit of boilerplate code and a new
compatible string once that gets upstreamed.

[1] https://lore.kernel.org/linux-sunxi/20250427142500.151925-3-privatesub2@gmail.com/

Thank you,
Chris

> 
> > Add a GPIO backlight node to the DTS.
> > 
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > index 7e17ca07892d..95f2ae04bd95 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > @@ -21,6 +21,12 @@ aliases {
> >  		serial0 = &uart0;
> >  	};
> >  
> > +	backlight: backlight {
> > +		compatible = "gpio-backlight";
> > +		gpios = <&pio 3 28 GPIO_ACTIVE_HIGH>; // PD28
> > +		default-on;
> > +	};
> > +
> >  	battery: battery {
> >  		compatible = "simple-battery";
> >  		constant-charge-current-max-microamp = <1024000>;
> 
