Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E24017D7419
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 21:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310EE10E6F9;
	Wed, 25 Oct 2023 19:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04olkn20812.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::812])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9D810E6F8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 19:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWzvzpsUlhh1/w/YsPeTvi92ex360JDVR41aaPbj8n3V+ohXzw83efCMitnckfvqNWAIIqihskM0UqjqDKRIbxhWpNcI6n+p5fc6czVMq2jc0+uAZDKx8k/q+bwgxk4AS3xWmhXSHxJ8R1cZGmoshDzJJNJ8MjjLp5lR1Y+9lXBBwXjYchVG5cWW0MzDnsUHsbz/CTI0SageUVJvuEvRIGY+F+dbGsLfQ69ITh4IW8i/GfkXSVu+LtdrUWg1WaWnW25FmskcxoiTUUJnkVq/HLU8aTM9MlTMrKzDfeBhui1sZtWJDmjtPi+OWL1STzb3R7y/3vIp8e+rfsb0dO2iYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3aT9anVxfUBj5s/CCoChFGogY5tOp3fSZ5HgzHc7Jc=;
 b=eawvSPpcECGb78agczDLfGxQixyBRC2IuAjEmKkwbvurImzEHxPBxnKe87dFgc9XtSDtqvpFzO6hA0osk8WONYP6zx1Eyl+6hGZlEX+jU7nRd+EJOwKmOWb02gTKH21tyRGh5fhSwgEKNZSBFyeDJJPoiLlouC4zRcJdGcGA3oyvGePH5HyE9rlkOjuKDtobjyhddiOrw4T5VTWK3JE4kE2eSj5QaFXLMWwT3ANPxUHo0t1SdcVNH7SaS+JMFKzoUPF2MJ+u7qO8yRQIHm1bHBGfqDBmlxuIZThX50BACnKbtIaJ0hgOW7tLpVgBEqCXPtxaKLVh5PDMEcyQqVTazg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3aT9anVxfUBj5s/CCoChFGogY5tOp3fSZ5HgzHc7Jc=;
 b=DrThoyo7ZoNv++Jk9lqJrH3yXHGTNZpfjw2v39uCd0Dvg6GDUWauFM1iAjcD+Ziip6opgXBEY5BxAr/U2LYlK8r1h1bH8hLgYCYZIx/0fageaBV1gdZzwAY49J8SCPLjwiazKXcZ/Q9YDx8aHEj2+3onYiXFZpq2XNUyrJ3xcH601nqaja0mk29IbS8L1nwjKL6//ZfyC1ys8cdBzNaOtV/e9V2wiG4r1BOvzK/7F93ummNCLbUN0YtbRvGav2J1eNjbQ7+Scjxg5sn3dBIk8wtJ2H0fpU9P/yO7o14TPJs+qngwW0twSylHPDpM6Q9/NJdewCaR0wrzo1BKDK9qGA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SJ0PR06MB7067.namprd06.prod.outlook.com (2603:10b6:a03:2e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 19:17:08 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c%2]) with mapi id 15.20.6863.032; Wed, 25 Oct 2023
 19:17:08 +0000
Date: Wed, 25 Oct 2023 14:17:05 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 4/5] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Message-ID: <SN6PR06MB534242C3DB235AF76F2AA81CA5DEA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <3083498.U7HbjWM52l@diego>
 <SN6PR06MB534206AB35C00B3D003765AAA5DBA@SN6PR06MB5342.namprd06.prod.outlook.com>
 <11399368.MucGe3eQFb@diego>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11399368.MucGe3eQFb@diego>
X-TMN: [I0mlsDPvpUUiNCARqLIuQ/vAt5pJVNvx]
X-ClientProxiedBy: DM5PR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:4:60::17) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZTlpsVL++wO++21Y@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SJ0PR06MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0ea563-e5e0-4209-108b-08dbd58efb49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LaE/pzd9djx/agyVbuJfESNS9Luqda0tHZWZM10IdUMh/l8L7jdN5dy5vMrPSfQjsVpVnjlqlFvamh5LYJgUn3k5lAYobxwzf+ZvE1WnwrnciqMAJkkhwSZdK09o0kmPBIy14cL85nfRQj9LrkdEHuiT49b9VQYO22dFM2l3qszc/d3WTPtErgq2gXhN4Wpy4RGIZq2FJMvEffx0f6XG3cCdCj9FQLI6iMWxqX7I0kNGCEqtJmCfi//WzTbc30Z3zcfvrcP81JVIGfoXOppwzljETGBRkCpDpisBsaU07R56NnFnqTz8Ad1eIV9689bDEz7gUGAWK784h+swYYtRWBTRmdsFCVQrkHgdtuvzx62YVZIU8sUL1KTMe8t7dyEW4JDbzlNzIafCHRXBENBH0o5PDWhmiYc2zLx3oGAbT+6UFpCDWP4Bhv6DmP+py5XXXzTYx7D4Pe1yxsSlUNKEi7kdI+M6s/Qx0Kr2RpsERpH/By/Z/J5H8RXHTXOgQdfZlTHesAgRl7/61K9sTp+fxN1yCKuapPCPDo9g/maKPz0NocgVXXsQGo7pA0W//TjL
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zsKRoEUqllasQNGBP7Uskpx7vjv9sohAY7eh6xwazyYhtf2Gdhz5geR+Qy?=
 =?iso-8859-1?Q?etLGAu8+WH1pxeMqP3TC3AIZtWiYrHmgAbi512EJ1pSnVhPTPY8PcPy4fH?=
 =?iso-8859-1?Q?78YhHgc927PeII60yn9E0vrujqvXLyvlYzw1hPpisiCnBL+075+WTAOtvT?=
 =?iso-8859-1?Q?Uvgtr8dcKwE1CRcov1nq9Vxv3gkm+zPf9Mrx9dm2IcL9eSE6+rFIfXYj5d?=
 =?iso-8859-1?Q?X4kecA96Z+kQpCpq6vIxSy0oxGlewe+1cA/4lpXtg4wzI1mj2G0Icfn5Z1?=
 =?iso-8859-1?Q?dFV5NJXCpYItVwTuFCocD8CaZ7CzB9Pc1HsBhsfcDBZ5LjDKDsmuNXIqwb?=
 =?iso-8859-1?Q?sFujV126ziDfUGvDcS5V/tv4sqKKbKqjEGKyidShoFGMXRaeZUOGJ8swuX?=
 =?iso-8859-1?Q?D6TxYj+aXJGKFb0urL33XNmXDv5xwJ62TWozy2aj3cMfx73dV9cqBagbPD?=
 =?iso-8859-1?Q?a8/1AhMqhe08HXt0z+8Ad4kajWLEmH1I8UfAcsZWn6jYKeHgp282P4+PYm?=
 =?iso-8859-1?Q?HL6vLzOcc2IsZfczM3OlR0uWSWoSljhIDyhzpSIhOAgXeilEQD1kPEfFsG?=
 =?iso-8859-1?Q?Fkj7luke11zc2kz+x18GhmV47rXrw4XOWp9g+xvgM6YnglJp3JbhX45TxM?=
 =?iso-8859-1?Q?2irBafs9yj/+0nPFwDahnJTXefQymhqUKKn3tWIQEsyvYg/yphMk3mh/R7?=
 =?iso-8859-1?Q?jjWYo/8+2gtpIn0xg5RFW5vulYwTWTrEf0w7ajoY1MiqCwJxgxQQLErIeb?=
 =?iso-8859-1?Q?22CyT4WDYptEJimed7bDVgDZUVjZrsVfjuEd+jjFV7IjRRiAuUXmDCeKMg?=
 =?iso-8859-1?Q?KA0c6BAtbt7qV1vkQRc/5m3rSI6unseqjaQqh3716O7i6AHzqbC+umuIRB?=
 =?iso-8859-1?Q?eJtF3HpNmy8TmsA8khEAzC6IzReCNma3fUwNgWfNBLAaZ0p6kf/UOtZ7hL?=
 =?iso-8859-1?Q?NzGs0iRZI7KwJCAqK/cHMnbupgSKMPjVmumznthQhJwl5neu9/BwsoTDUT?=
 =?iso-8859-1?Q?gwvTcjmTVgrwwOkGNArcH7HkjCLRrEeJEP/9swOoQu/gB7dvISsBtxV4TW?=
 =?iso-8859-1?Q?Ht7ZxMirHs97d6yXVb3ZLVl35SB0TAvoOfIo7XTlJ838aEIpUGU6mR9vqq?=
 =?iso-8859-1?Q?4KCZRxHQPC0VVut4VcHlgVRhQWUgbhD5ZnE0JNWIdYHkUQzxJ5g6SKGKhI?=
 =?iso-8859-1?Q?fL7qtQ1nzTyTCxNLGG5UCzm0+lkJFfd4GPnu3nneRFeBnI6UsqxS0SZ1fh?=
 =?iso-8859-1?Q?mn9uN9/QcrG+IEl6YCdLOiwiRVa8EfLYjhEq1pVcA=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0ea563-e5e0-4209-108b-08dbd58efb49
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 19:17:08.7365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR06MB7067
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 24, 2023 at 05:47:37PM +0200, Heiko Stübner wrote:
> Hi Chris,
> 
> Am Freitag, 20. Oktober 2023, 17:03:08 CEST schrieb Chris Morgan:
> > On Thu, Oct 19, 2023 at 07:45:17PM +0200, Heiko Stübner wrote:
> > > Hey Chris,
> > > 
> > > Am Donnerstag, 19. Oktober 2023, 16:43:56 CEST schrieb Chris Morgan:
> > > > On Thu, Oct 19, 2023 at 11:21:47AM +0200, Krzysztof Kozlowski wrote:
> > > > > On 18/10/2023 18:18, Chris Morgan wrote:
> > > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > > > 
> > > > > > The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
> > > > > > powered by the Rockchip RK3566 SoC.
> > > > > > 
> > > > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > > > ---
> > > > > >  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
> > > > > >  1 file changed, 5 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > > > index a349bf4da6bc..a6612185a7ff 100644
> > > > > > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > > > @@ -674,6 +674,11 @@ properties:
> > > > > >            - const: powkiddy,rgb30
> > > > > >            - const: rockchip,rk3566
> > > > > >  
> > > > > > +      - description: Powkiddy RK2023
> > > > > > +        items:
> > > > > > +          - const: powkiddy,rk2023
> > > > > 
> > > > > This cuold be just enum in previous entry :/ but I remember we talked
> > > > > about this once with Heiko.
> > > > 
> > > > For hardware that requires a different device tree, is that possible?
> > > > While most of the devices I've worked on for the RK3566 series are very
> > > > similar for the moment only 1 is identical (the RG353P and the RG353M)
> > > > and can use the same device tree.
> > > 
> > > In my reply I pointed to the Rock PI 4A/4A+/B/B+/C family, which also has
> > > different devicetrees but is part of the same family of device designs.
> > > 
> > > So similar Powkiddy RK3568 based gaming handhelds also sound like
> > > a nice family name in the description ;-) .
> > 
> > Gotcha, I can do that. Would you like for me to go back and do the same
> > for the Anbernic devices as well? I can do it as part of a seperate
> > patch series.
> 
> that doing that for the Anberic devices would be really nice too, so
> yes please :-) .
> 
> Thanks
> Heiko
> 
> 

Did you want me to resubmit the series or just push the changes on top
of this one? I'll get them both queued up.

Thank you.
