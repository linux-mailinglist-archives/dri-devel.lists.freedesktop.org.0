Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F35C13055BD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F646E5D2;
	Wed, 27 Jan 2021 08:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2104.outbound.protection.outlook.com [40.107.92.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B4189CAA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 10:19:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeFLs7vwLAVhIylNkMRL3W4Uajyj0N2FwUMkXQVMhHydgcKH0fFxzyk0YoE++2S+juBZ9EZcZMwNMsjicNvbh6Ml6tMkiIwNiwMij9eWzIyAduMpNZRGWCNRKCEXKKJOiaS28/rDHbpCbcjTTMDU4ON1l+ImB9/Ca6kObJplVI049tyPTPL3kr+ISUWh/fEkk0JkFbFXXyIA+S/G/E3csnr29n3YBVq5z77iVX7ftkYTXCuU1jLD2USTXvfFLC+g2+zUstuG6JV9lLGo7eT9CFiiWotJWDr8M4V5EuFxKClPX4z81tZT3OiNRix946EGuM8mVWUSELz5SbwFqBMmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+Z7Elnhm3BhrgNeRyrqBv5JwYYEJY57zgz/EOQdRlg=;
 b=Rt/xGsYs8Q0krRJF7rqXnGZAmN5pevRDryaLUEBDw/HVGFuIbm9qfxv4CxKkMj0u/5BFb1eynUd+svmzkjW56cNn3dGFA90MGUuLIQBPXKBsUIvvVO1nffGikWCDN96htwUhseOs4mLx3u+c1E7Hds/NXGy3hwnq4PqOVEg72c7fjhEUm0q10gJ4NrywyIcum+MK3bx7K5/38fHt+NA11bZV0daWbUoUp1I0kqARXV982UErjdzwybV3e4QkMuuv8hSdKdSQ00SVaywKTM8MrGEwe/tc8lws744jLYVhKw0vw4Vz/FxMOqWbujWcEjgkLiBiVWvOAPdjWY8lWmSOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+Z7Elnhm3BhrgNeRyrqBv5JwYYEJY57zgz/EOQdRlg=;
 b=euDil4XuXMZkJoPfqVc5+ciA3EeOfz0M/yjrda5SEw+IAsZmR7Gm4NNMfENuuzlklWJ/fw8IqBsqehDEU3s+SV3qysH83PoRtszNXmRxQf77GVzM7WXe9OJJUfL83HkRuCx4XSalMshWHKDfuIUZjjVo4OaPNrRWQGBpXWQo79Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7359.namprd04.prod.outlook.com (2603:10b6:a03:2a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 10:19:05 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132%6]) with mapi id 15.20.3763.019; Tue, 26 Jan 2021
 10:19:04 +0000
Date: Tue, 26 Jan 2021 18:18:30 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings:drm/bridge:anx7625:add HDCP support
 flag and swing reg
Message-ID: <20210126101830.GA32321@zhaomy-pc>
References: <cover.1611572142.git.xji@analogixsemi.com>
 <75e29d7386df2ebca4a8e3f0b91c8370a4a8f74f.1611572143.git.xji@analogixsemi.com>
 <1611586295.672940.327907.nullmailer@robh.at.kernel.org>
Content-Disposition: inline
In-Reply-To: <1611586295.672940.327907.nullmailer@robh.at.kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HKAPR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:203:d0::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HKAPR04CA0018.apcprd04.prod.outlook.com (2603:1096:203:d0::28) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3784.11 via Frontend Transport; Tue, 26 Jan 2021 10:19:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e26b7eb2-498b-4fb0-9c30-08d8c1e3cec3
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB73590A0BAC31D3E4C148DA62C7BC9@SJ0PR04MB7359.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iy2A/mwol1B6HCLgx//k4msxzh/2LEdVr0AWGn9sd28ANU9fuwGhhg5nKDDVHEXj4ZcEowTAM6auG1KBTD26PkSea3y/KmqO5rWTkzNqeLtHe62e9noi2jJdF9nEznPIj0Wk9PIMVTx2JTw1AEy98SZlaFQ1zb4T8lenUDAttID3Eoh2Wunv13UqNEp30ZxxklyofqpK+iAeaNN4YeSCsp3twAwbiXGFUh3eEbGzK8Yg0oRigxLOR6UFElAd+E1InE/g7iclDyp1fFsA0uo/MGteT9JJCsgCRDI7CoE7jm2omtgihJa5qRzow0aKXl4xOG7enOL6wtQF3ztnwu4irOqmvCcJoJC1GiCBWERLZziXvYFh+VYKwcGKcC3B7ITYnF65i0N0nkE7crKU8Ar5ml4cEmSuUgvQeR1RezB6P3vQj5JJ4NZT4uiIJ+0BTDpSaBnoRiXu/KnPu2FpoDyYhG6Q9sUFFsni9v9CGqe6EAOkfes5N/ck1/W5yOZO0qcA6Z5OHuCkL266RISaR2MqCsgC8etUaIuWV+9nP1vvwak5Js9CetR8YH1r/hKmD2BwvWecwy9Sm59G5/Slxpq1u/6TY+zK3/LlhIhfxKA8jKt6hv4aOLp6kbdjjTJPoujvM1eVqR5JxuCyPugbs6HaWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(396003)(136003)(346002)(376002)(366004)(9686003)(1076003)(83380400001)(8676002)(52116002)(2906002)(33716001)(6916009)(16526019)(6666004)(26005)(5660300002)(66556008)(6496006)(33656002)(55016002)(966005)(66476007)(54906003)(956004)(4326008)(8936002)(478600001)(66946007)(7416002)(86362001)(316002)(186003)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Nf7YoK9A0FmNDPAumgnGIShN/pAAFaH2MtUdNmatHw8tCVPRO7zRdknjM692?=
 =?us-ascii?Q?nx0UJCG4K1CVfNiolENiWsHGA0Zp1s8A/IcHUFSRTOBX/n+zAMGpyLkoIDoa?=
 =?us-ascii?Q?6hiMAEBxL0SFuxEcShLu+MHkWbYTgdFblXSBlQRgMVjfapPMexmZgaVfF1qY?=
 =?us-ascii?Q?TJekb56CLNgfbAHKRhBsKZkXj25iDTIWFBMjX3A9XnMnYX/W/DKXwFFXNI1I?=
 =?us-ascii?Q?5TDrWR+hqoX4p5031ruWmE9OBYxZei/mpoaiPNyAfOs/4KSs9gfjNe5oPfYi?=
 =?us-ascii?Q?G5LGTKb71SZzOrVb4yuAleIfyD+KX0+HXbyu4tJtARSAA/jzjlYidRgF+5Pj?=
 =?us-ascii?Q?YLHhyXhuGoKhiqqwwqlhDzlC3o4VNLDiBv2ee+dJqT82M2IrKhUbov2vTIAC?=
 =?us-ascii?Q?8idho1jhJlferi48vIljUXqAdGaeXAkt5l0wWrHxNxtpfd1jKgGhQ0aq9Zxy?=
 =?us-ascii?Q?o+Y9pHr2KE4pPQfqxuAm3yFZUmjofxKwGJU+tlzD01fzYJLtGnmsDy3gs/ot?=
 =?us-ascii?Q?PJtorzzNQ3K6IeZlFU3EFLNxPHRJptwcabwyxiUtMmnJmeu46EOecoqKy5p8?=
 =?us-ascii?Q?a9a0fCVogyOw54PV+65aiGZpxmAAksuhmragO83TcFCrrjPXx+S4DgF5kPjO?=
 =?us-ascii?Q?M69788nd2XmmqtS1zFB3WKoTFQB75FSGuFnFZhfGerRr+zKjOPLFDNy8Jxuf?=
 =?us-ascii?Q?+des9P7Vybzy8Cn8NqnIde2d2cSKIWX8Dd57AELeSLGVmkLVg4WwH6Q5MjLV?=
 =?us-ascii?Q?GvQY8O7MtJGsm1z7M0S39WS+PONxJl18M5HwrHlOGnwDM/l5nXrNQr420W6F?=
 =?us-ascii?Q?X5cDPsRYr5OKryZ52FuWUL+eIbwbV1soEweuB1wk6nY9XbqkQRs7xOmKRlRA?=
 =?us-ascii?Q?jBADp+1sWjbgx1ejUkN189QpmpZVkozHHmWKV859LLT5RGU9VnjEM7l4e9sy?=
 =?us-ascii?Q?ETFK/Gozt095gFuOQf5CUzTWGdn4e4W/2DxJbLikw81Jt5thUQThXrHZpvgg?=
 =?us-ascii?Q?hZR5OukP/SAvHNfKCFyp68SUAS+p4xGWzxr5Y1BMZYahmhwx71kXcO9v+kAi?=
 =?us-ascii?Q?M/8yKOPf?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26b7eb2-498b-4fb0-9c30-08d8c1e3cec3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 10:19:04.6694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDG5m1TzXiFLGzuYP2njiEn3PauXMCShi1Nmf4vcRoJ2MCx1QXdRoo7iKs7sMrC7S4PRdUgZgXzTNWtSg93p8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7359
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
Cc: Nicolas Boichat <drinkcat@google.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 08:51:35AM -0600, Rob Herring wrote:
> On Mon, 25 Jan 2021 19:12:21 +0800, Xin Ji wrote:
> > Add 'bus-type' and 'data-lanes' define for port0, add HDCP support
> > flag and DP tx lane0 and lane1 swing register array define.
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../bindings/display/bridge/analogix,anx7625.yaml  | 57 ++++++++++++++++++++--
> >  1 file changed, 54 insertions(+), 3 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
Hi Rob, OK, I'll fix it in the next serial.
Thanks,
Xin
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dt.yaml: encoder@58: ports: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dt.yaml: encoder@58: ports:port@1:endpoint: Additional properties are not allowed ('remote-endpoint' was unexpected)
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> 
> See https://patchwork.ozlabs.org/patch/1431199
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
