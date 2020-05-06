Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209DD1C69AA
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978EE6E49A;
	Wed,  6 May 2020 07:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2096.outbound.protection.outlook.com [40.107.93.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D695689F5F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 06:50:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEl/9lzCfMKMfBjrnVp777TbowRDjf2MmqxYTMg8K2xiZRK3r92IJTBKbd//R64tyxGX+dUnTiCdz5c52ApaO48z7ra60C/BVNDLqa1lzjNHGk8IOJ5VpCaazoFkSctmOh8cLHhb0Euq2Qppt3YePfD+JyYOm1wZEL9MP6J/E0As8p8/vf9N8wElPQqBzP1S3ZwWKPBZBfs+onDkj0PmXQw8PLbt2yIy6Iv34c/B4JgmALnwlwC80pwXpb3H4VarrRNMx/2y0RJbbeSiCelPoWS5ziFTNud/od4YGHs/K0K7PT/OqYnpVYiXMVCUMSXutsdDjME6ZD/iVpeKDS179g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSVbtQMukT9KB42OEF/y3Q1vF9tTZHcWQXv3omvDUV8=;
 b=Gxq1AqItD1fjrvveiHYrZoEGyXn1YseBH3dWZsXMe30fOz3aeDaS7bVKATDiRhAXifNUaIoUnuMtEzQ6rLmyWVKTQ3srS8K3hF8G6bn5uf5JPDsH/YHKjoG0h4pyxB932kgXBm64g7wL63a0jwGGEHeL3l8pAwhcKZXwxueWMF9rdADQTlIYBGK4WUQHEbxYbAx+0d1zskGYjzXdVKLLY+fHpt9/tUQ5FAi0Xewp2nPdp6CaDhjlAQcm9Zy3HZhwgW4DsaGzG/AfkYXi33CXeCn/ifKdM/mmWDHrTSDJDvsU7JjlMt0Caa1MUU9PHtI/7b5Qrl8oUineFjmhiyVAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSVbtQMukT9KB42OEF/y3Q1vF9tTZHcWQXv3omvDUV8=;
 b=MrHddZ807bSwaYwO3qbY2mw9fXWvYwU77wX8UNf9xMsQqSGQq9uE6VuEhS15n3C6y7Ot3Y13+bdLmZqZEmzGkddP5P8BbdvqhyvrwKFsjKiYq9RAQKiQJiqth0WB7bNOwZ2er7v+NFInMuSd60mYxzTxcRjr6PRDirp0AReNx3w=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6882.namprd04.prod.outlook.com (2603:10b6:a03:21b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Wed, 6 May
 2020 06:50:10 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.2979.028; Wed, 6 May 2020
 06:50:10 +0000
Date: Wed, 6 May 2020 14:50:01 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Message-ID: <20200506065000.GA29064@xin-VirtualBox>
References: <cover.1588236052.git.xji@analogixsemi.com>
 <a5d43ffb0250468050be5b9271567fadd0fe4e1c.1588236052.git.xji@analogixsemi.com>
 <20200501211150.GA537@bogus>
Content-Disposition: inline
In-Reply-To: <20200501211150.GA537@bogus>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR04CA0071.apcprd04.prod.outlook.com
 (2603:1096:202:15::15) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR04CA0071.apcprd04.prod.outlook.com (2603:1096:202:15::15) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.2979.27 via Frontend Transport; Wed, 6 May 2020 06:50:08 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5efff575-b9d7-44e2-5405-08d7f189b7b7
X-MS-TrafficTypeDiagnostic: BY5PR04MB6882:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6882F5540D5FD7413C658586C7A40@BY5PR04MB6882.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OIqXGRtDbzcSSwko3SZ0QSRmfcYVKeLfOs+yXj1bJPs1hv0a3Wsv3hfeIe3gw1BEL3X0JYt6r7vjlh704JeIBw7wUU1tlnN7Mq4dH5+FbMgRx3hh2f/v5uVdDKZqyBv7EDCQCSgv1oJ2UiPYiDc/QokcJzdmdtlhaM1gE5cbDTOVRx6iCaMnva3WzI1+X+7hjvhC1iR4aS+bGaDjgbzvrH6/9EmGT22R1kATwsplRR70ybt+mAin1VWC+0oBjQgM0YzCTH86WaOAn73eqm0FfTDMx1V0u7RqlnIqESkIwntm4VONNMvh05uIJMwdycrT5MSa3ZvtAP5GvEK3AMwbZi/2J4xBAu6gjqpturu9DynvqkEoLWEE5ic1473KFHzckEtKfvp2ExL236YUD2PveW2eUlsEakmX7K0u6tK6bkl0o78lyt6EJwsJqrYhYetGR2yLS0ehkCQRa1Wr8H6MosV4ce7GqFVpNBL0VBfcnR+PDjZJ34e+VwDwC8wD/Yec3CkD0EfnVDuYbGNwwmHnntxJAN1Wz3b0+uIXT2Jq3IzVhVhXoACSugd95+IGwqRaGoI0yzWvhnxnyKcAOqpcN7Kwhm4H9X5S79Q024A1RdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39840400004)(396003)(136003)(346002)(376002)(33430700001)(8936002)(1076003)(107886003)(16526019)(4326008)(8676002)(186003)(66476007)(66946007)(2906002)(86362001)(26005)(66556008)(33716001)(55016002)(9686003)(33440700001)(5660300002)(316002)(54906003)(33656002)(52116002)(6496006)(6666004)(7416002)(956004)(6916009)(966005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: cbSrMHstWw4NJzbJ16ppbAH7FTFn3ADnYINPH6Z+ASfWTuhbgtuvYwxRQCW5fnDaaZiunAazjSnBK6s0y5q82XgE2QD8QvZvnBZWxa8m2Wu9B2Al9vJXCdqGzSVYXaHNJW5BXAZxntAZjGqbv89nWzBlCjOZfveEtVm9TADI8zXxm7dsWSSNpquGlYvimw7f5+IF395Mx6I+u/gXP2a2CcdfIbtM33WEb8KoFW4bdsuaXRa/mcOwZznyQUcJeJ9v43zltBbsMSZaVRzFdJzLW9ihzN8jx91Pg6+oF5BEz+6ZwJ4/Ew7DEXiHzRpzcefYjOM4JcJdeaBlfhAM011ksbT/L5J05hlWATgB2qjrJyD3/haeESipzFBfJ7RwWgtL3StrV3GX/fMkSggA7zNmklDID2HbrIO7ftRBbdfCWDHZ/KJ5KkHqrVBUxhIZlYFxZewhcQyrzugHK3PHdTJddROmtRBhAsA5ggui2lYMWn+NcMuhMy5wwY+xdZMzSxgcWFiy2Fm5y+jQq1/WrDqrRJZs5/I99V5tnVz0EmL8kAsj/af9fyrWlnMf8BtoQ42opD76rZJkbadPTjj5L9hEZAjOvjfGVz+7Uau3puVCRBRFG7FMoOvhqfUBCpN76bwA0GDpatEHgXu0/SV4kKz5H2ZoLLSZ4EykG0E90RJf1l0Hy/WcSXcFz3h53Kh5QT/4EP7MQjtiAafxAvgVMvMtGjjBnlz1GpQeSUUEK0Xc4zdxc6UqlK/RAPwr9j1Gr2elxL3GJnp+PPKCUkqvjPtf3VVy8M42QGEhIlqKaZLiRwFhmm54ML51070Cw7DsViL6
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efff575-b9d7-44e2-5405-08d7f189b7b7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 06:50:09.9287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5JBsnlzPLtZx18XqivqqpFIqjKDKFPRaKBXkULtUZzBSq/1m5GFVCXitToEp6Fy9HvtS2GQzxumH2HmVRQoJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6882
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 01, 2020 at 04:11:50PM -0500, Rob Herring wrote:
> On Thu, 30 Apr 2020 17:34:11 +0800, Xin Ji wrote:
> > The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
> > for portable device. It converts MIPI to DisplayPort 1.3 4K.
> > 
> > You can add support to your board with binding.
> > 
> > Example:
> > 	anx7625_bridge: encoder@58 {
> > 		compatible = "analogix,anx7625";
> > 		reg = <0x58>;
> > 		status = "okay";
> > 		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> > 		reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 
> > 		ports {
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			mipi2dp_bridge_in: port@0 {
> > 				reg = <0>;
> > 				anx7625_in: endpoint {
> > 					remote-endpoint = <&mipi_dsi>;
> > 				};
> > 			};
> > 
> > 			mipi2dp_bridge_out: port@1 {
> > 				reg = <1>;
> > 				anx7625_out: endpoint {
> > 					remote-endpoint = <&panel_in>;
> > 				};
> > 			};
> > 		};
> > 	};
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../bindings/display/bridge/analogix,anx7625.yaml  | 97 ++++++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dts:21.13-26: Warning (reg_format): /example-0/encoder@58:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> 
> See https://patchwork.ozlabs.org/patch/1280084
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
Hi, thanks, I'll fix the warning in the next serial.

Thanks,
Xin
> 
> Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
