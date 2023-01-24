Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96B67926F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 09:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9240B10E61D;
	Tue, 24 Jan 2023 08:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4659B10E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 08:00:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oafhFo/Rt8J/ZTfFK1lCUbvPVWBqLglPpfWt5g9GXHJylGDuNkj2STHl9+W7iw6RSUwxUbhiXKc3EpFOKSS4EPztmFMWk/Tn9eAzS5r32/8+RwbNLQw2WaJ1qYLxfkSyTSVOJ0jPVjG6oe800eBeN6mBTChyM+hYe233to0AtzefB4fX3HpGtgZ8/UypQDFMkZC3RgtyWdjaTld42nQbnEeCuksQzgp4RE0pqHHeERh8TX/kQY3jV6E+zO96pfbRZNAIcQ4qYFYQk8V4DKFMV3TQuYTVxz4xoHsouVA+koGStRnItKiFZ2iRaBJdSg1g0Ee6UfQqaliskH3bgsgEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10Q7LTGCXAZ5WaTdhKy1nfI+WNRDdVnQMBbQAVvVvC4=;
 b=YNYLL0GqnHwsVGSbo/Mc5SJcj11s9VpFDoqHyn5JXHU42F8IZ1ItJc29oVaG6oqKlQ9kVr1UkA8lsHsqdYTjt6nOg/T7ZthgD5c7Qpr52Nfw4u3MaRziEvfUZztsSqrO38AXd4UlCia7Z6lMt4zioK+x5xU70s+zHqGOxGAgYp6bt4c4rgCYAjhDvRTdvM5bLDJUeGq1TPftj1kQftn3W6Zl7Lz8ZP7OeAMM7qYB0gfnhu+AIIV/CORMXWIXcWtapCBNfW4lS5yBEzCmdw/TCht6c4yTFjPhkakdPv4DR0mSWGLy1pI6Lj7NcpCbhvCl14FnxbvAv6stjZ5z7c6gVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10Q7LTGCXAZ5WaTdhKy1nfI+WNRDdVnQMBbQAVvVvC4=;
 b=MxEeJOJjWXeZl3ne6/Wyf0j3QUatRJVWPn3PSJqx2mawjJDERlbD+yZ1gwi3ibdaY5GFbJQeNkRRUL+G+2EK9d2ukCY1Ou+rnQm8lUiMmo/Pcb6CkHmidhLytDrxqKrr4l/uJssJf7Vy4Me1dYuiZYzkW3TQsAGBq4q4sVzLCqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8937.eurprd04.prod.outlook.com (2603:10a6:20b:408::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 08:00:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Tue, 24 Jan 2023
 08:00:22 +0000
Message-ID: <7ac57bc28da40df054c81fd74f69207af66ad97b.camel@nxp.com>
Subject: Re: [PATCH 2/2] drm: lcdif: Add i.MX93 LCDIF support
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Date: Tue, 24 Jan 2023 15:59:39 +0800
In-Reply-To: <ace76615-533a-9295-8271-95262859d287@denx.de>
References: <20230123072358.1060670-1-victor.liu@nxp.com>
 <20230123072358.1060670-3-victor.liu@nxp.com>
 <ace76615-533a-9295-8271-95262859d287@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: afe1b217-60db-4162-e5d3-08dafde10b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /F5Y4esHxJuMTD+bwAqPb/i0kEDDeLFFw9WICXSHpuNNaiPJ6kqYnSOt68H+/p7LHIsCvUt5pggWmeBA06D2bx18n4vssUjMpcGXIsSErrEtoHOw1x2HpK+KKXIK4+JGZ/X1R9/bzV3AcUeHNoOZS8QtB4MO682p3r6KL3IjwMfoIZljhhdv7B+J10iubMQrTuKNs4xR0j9m8a8kyAPIreg1KIg2FqjHA7IZ4R0KSxtItxAqJbsQRyaFNQeqVqdz6dPC40JRTkmfMnfw1Ydx17+Quq4MdsAysYwsNkaOV4AA3SfknGMHtXSlOWgk3id3NnSOOf/+b2LJ04/NaNquXzV3FVfcZgDzHDmgYyzl/XgV96lO7m6YsOZUb0K+Kx7pA3YYqgA0Qil5jkEgam/fqjq72NSFRucO/H4CtujTkjbUxUnZNoJojEp3aQvC7hoj1R61CtZqEWASlcwpmi67RkejZ+FPujjoLJXVxzkdCBUbtcaneCv8ArFcjiEeSxYgCnaeIOO0h6jaDeC30AUEn/cvjLr1oMu5qwmOdstoyj1c0mHE2gOnq8lnL4Me71GHDUwnCwuBSV6H3y8CjDCaQajDBQaaG+GdJNkMLeCpOZkzMAqvyS5BdDS0IYj3eGNzKrlr5D+GTPIrhkl3TQcaALhfu1r1H+dxuqNjNdFOuhOzwuhfa5YUCnNRAG62VRxKICU38Ld5EY8p4yfr7bqtFp4RgRBSqHG1W2PUWtUGEgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199015)(83380400001)(66556008)(66476007)(86362001)(66946007)(4326008)(8676002)(53546011)(316002)(36756003)(6506007)(6666004)(26005)(186003)(6512007)(52116002)(6486002)(478600001)(2616005)(8936002)(7416002)(5660300002)(38350700002)(2906002)(41300700001)(38100700002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlBkNGR5dEJyUUJVK0VpM1BRNVZGMGJFeVkyazJjTEtDb050TDYrVGdJc3la?=
 =?utf-8?B?RDNlZDFqR3NRTUZEZ1pzc243ZUpEOFFrS0kxVG5XTmxyQVlOTUNRYTZqemdX?=
 =?utf-8?B?ODZ5NlhVbE0rc0tzbG9KejdUeTZET2VVNjgzSHBlV1BSNVl4eVIvMC9BU3pG?=
 =?utf-8?B?UVU3Rk9qbkRhMTZzRjFPdXhJTnU0WnB6cWFzbCt4UkxsYjk3UDJsUVRHSWVx?=
 =?utf-8?B?VXRVTW1qckE0ZE5kR0xTNlp6R01pY2U0dzkwdXUvTXYxOFZRTnVoRzB4WEoz?=
 =?utf-8?B?ekdZM2lFR3QxaENrZDBZT3krN1hNUWZxY1lERDlqSGRmekRhRjNPYVFQN0k4?=
 =?utf-8?B?akVQSzFteVJkTnpwL0FZdlRIM0xxVHlTUlRrREdEVXJoUVpmVHpPcXIxRlVE?=
 =?utf-8?B?T3RwQzBrSGNxNDN0SDV0S1M3dTk3YzNEa2I3bjJ4c3BuQ3JTeU9XQ3ptdkV1?=
 =?utf-8?B?K2krVzlnbjRGaDRDMWpNa2l3OG5FR1huWGNiaWErYmJnTnR1WE1JQmNEZUtC?=
 =?utf-8?B?N05HK0ZpN1JRU2syK3ZtWU9MVmQzSldqOS9HYmVRZktYREJ6TnFhbkRiWmtn?=
 =?utf-8?B?RVdJN0NCRUlpbTN0WFM2V2ZrSWR4MG9xUmxCSXRSa3R6cm83YTZldDJyckk0?=
 =?utf-8?B?dCs4OXlrRUVqV2UvTTQ2ODIwLzRndnNYSzZFcy9rQXJadFIzbXdmZkVYWkZW?=
 =?utf-8?B?YTZZVHl4dk9qRnphdG9zcmlMaVFTcWVtRGtUU0NKdDlYWmtUc0lvZmlpRnY4?=
 =?utf-8?B?Uy9RSStVN2JSSUxPSEdCbmdPK3lTQWdsK3VWZDdqcksweFVqZ0NmRUxvTTM5?=
 =?utf-8?B?NzdBNXZxMER5Qzk1SGUwK1ZWR3M4SDM5aGxSQVMyNHArcnNLQS9UbjcrcUtU?=
 =?utf-8?B?bzNVYkV4TFk3YTIzL0tSTCtvaEtBT09MVkxSYTB2eG9YMUFEQTdBWkxHTWJX?=
 =?utf-8?B?YThRaGFabU5JU0hRNldnWHpDdlZEV1NEbWhhOUNlTStUcm00VmtVN3hieGo0?=
 =?utf-8?B?clZQTEtxd1dlOXV1eXRoVkRsc2dKV2JReVFFY0cwbnVZZ1VQaXJIM2JUaFU3?=
 =?utf-8?B?RDd5ZlRpQ0Z2K0NDSlRQRzl0T0I2WEozL2dHcVlrcVAyMzdxNkY0T0t4WVdI?=
 =?utf-8?B?a1dhOHRkYVpkQjdxTHFidmVISkNvK2QwN0g5QXJiaGlYSGc2RXBqOW9YNkxr?=
 =?utf-8?B?Q3ZUSDJuN2o4T2Q5UWYzNXpPSCt3QmJ4ZkF0Qm5vRWJWb2YrVXVSdTZtUjlT?=
 =?utf-8?B?MW9zSWtIV2tVRERNUGp1WTlwOEFuWjJoZlZxVDBsd1RnUTEvRDU1SE9qZURZ?=
 =?utf-8?B?Y1ZENC9JMGs0dTJFV295REhYc3NEaEdiRTZZSW5sMHRSZTBkbDJVa2N1RTVX?=
 =?utf-8?B?R3U5cXVITTUvNUVDalNXSEhDbWFKa3JBSVFYMElFUkxuZ0c1WW5Caks4cm9R?=
 =?utf-8?B?cW5nWmNnc3Z5bG0wclB4TUkzeWFSNENROGIyb0JlN1BYZ0JEYm55ZGlKUWdm?=
 =?utf-8?B?T1JaVmdvL2hyaEROQk1pN2xuZytNTDZ3YU1QT3lrWm5wTE9jazhwSmI2bmkr?=
 =?utf-8?B?UGc3Z1kwd0ZOTUhxK3kxNVZxWDRCRCs0TlVrd3dRSE8xd3FZTXFYN1N3MlpD?=
 =?utf-8?B?VlR3c0s0d1JUUE1vV2ZtanVRbE5Pd1gwaWJGVEVVbjhtUklQckd0ZVRFbitY?=
 =?utf-8?B?MUd1M3EvT3dtdS94K3FTZUh5TmFNMGh4NXVodjBKUDZ2azFrQTMrNXB0aTBU?=
 =?utf-8?B?V1Z6UUNDQ2J1dW1xY2dwdDcwN0dMWXFFUHhPZnhuOFVlUE91ZmUxOWhZWmNV?=
 =?utf-8?B?cFBzeFVUVDdwcmNUcERvRTdJYzVIQ0RWT0U0cDQzUXVoRVZqbFdvelhCVGFx?=
 =?utf-8?B?aEhLSmR4dm5Fdm1KU0x3ZVIzVjhNUmJmZDFrZEZQbURVNmFBY05kVVREMzRI?=
 =?utf-8?B?c1dIVUpQYzBteC9MdldxM1NtU3lyb0FvTmxYeVJuZHZqWU9TUjM3NGU2Yzdn?=
 =?utf-8?B?MFM3NTRFTXRDeHROS1hMcGw0d1R0NTV5QlhGR2Uxbk85aGJqZzhsSW5INEc0?=
 =?utf-8?B?VTRydnpjMFBSOFFsVkRqSTRMVDVmbk1RQVV0ZFYyNHpYeGo4QkxPK3FCNXlP?=
 =?utf-8?Q?m4fVjVZevvfZ75VALagsbRn3K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe1b217-60db-4162-e5d3-08dafde10b1a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 08:00:22.3533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqWkRXdlAF2Cc941YJyThnNJpl5B7H8wjTkqwhywLo3zNssKCD86FqRKRmx09bpkYB4xbfhm7AfQCPTip8Z1gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8937
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
Cc: s.hauer@pengutronix.de, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2023-01-23 at 16:57 +0100, Marek Vasut wrote:
> On 1/23/23 08:23, Liu Ying wrote:
> > The LCDIF embedded in i.MX93 SoC is essentially the same to those
> > in i.MX8mp SoC.  However, i.MX93 LCDIF may connect with MIPI DSI
> > controller through LCDIF cross line pattern(controlled by mediamix
> > blk-ctrl) or connect with LVDS display bridge(LDB) directly or a
> > parallel display(also through mediamix blk-ctrl), so add multiple
> > encoders(with DRM_MODE_ENCODER_NONE encoder type) support in the
> > LCDIF DRM driver and find a bridge to attach the relevant encoder's
> > chain when needed.  While at it, derive lcdif_crtc_state structure
> > from drm_crtc_state structure to introduce bus_format and bus_flags
> > states so that the next downstream bridges may use consistent bus
> > format and bus flags.
> 
> Would it be possible to split this patch into preparatory clean up
> and 
> i.MX93 addition ? It seems like the patch is doing two things
> according 
> to the commit message.

IMHO, all the patch does is for i.MX93 addition, not for clean up. 
Note that the single LCDIF embedded in i.MX93 SoC may connect with MIPI
DSI/LVDS/parallel related bridges to drive triple displays
_simultaneously_ in theory, while the three LCDIF instances embedded in
i.MX8mp SoC connect with MIPI DSI/LVDS/HDMI displays respectively(one
LCDIF maps to one display).  The multiple encoders addition and the new
checks for consistent bus format and bus flags are only for i.MX93
LCDIF, not for i.MX8mp LCDIF.  Also, I think the multiple encoders
addition and the new checks should be done together - if the new checks
come first, then the new checks do not make sense(no multiple displays
driven by LCDIF); if the new checks come later, then it would be a bug
to allow inconsistent bus format and bus flags across the next
downstream bridges when only adding multiple encoders support(also, I
don't know which encoder's bridge should determine the LCDIF output bus
format and bus flags, since the three encoders come together with the
three next bridges).

Regards,
Liu Ying

