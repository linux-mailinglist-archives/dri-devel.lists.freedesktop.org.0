Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470FF6AB8AC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 09:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C49210E189;
	Mon,  6 Mar 2023 08:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2113.outbound.protection.outlook.com [40.107.247.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410BE10E189
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:43:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtRapdj/FZJxYhXBHoKuts7L1RLYlXYrtu/e0HxWLoUjsc+Kc+ihUlLzU4zkcunKRP3mNyBemp5ZDtZeBr+qBf/L+0eeeYXAQetsdPKHPCqhcvmIAJ53hPfRoW88Lc8ospQLzFd4f0dGgizsS+1ioujgHJ28JGihJBmd6lyigPB09DOcx5JaUWKQrG1wn5MP7oYdNAwmqwmpoGiY7IU6W6fV3ejFpLdxzYO3v4qdI41oX6rK93rjTriVyAOUBbSjxCw0Y4ftTmVGDp69ERvuvfECyPpH70456u8QRWzCXyXu/OUxOCNXXJ2SJLxePySBHMWFdJM83iuR6bV7qy+RLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aI5LwcU6v12FsmqjZDfLSeQPryTNt/F/6G/vwb9Dnak=;
 b=Iqzh/cPhDa85soC6dGGovv3VpDHvBd3RcvHoTOnVfGYKyq2F3gMFvQls5uYTC4bsHDs6vLsKPeNMN6tCXfC7St1vLtRfcqs3KrrxmCeyuuK/sx0qo/QtnHA4Y3xhxY73jTABGY0+mWySa8Yw3k2jR18kKXm/l9h2PB/vxg/Kxs9a4HciU0UkoSgKol+cFi90cCRVIf0lLXXmn4e+RoNo2uDDN/wobvwpdbgZWRHxmeSTzvWWf1UpOPMxjhR1nhMOgqRAVWdBEXL264NSKGCNI+MTlKTzZ9GYLy/7Qv03xADdxA1oQVONJXb8JrQTDUQn681Re38GBMfxAHgcDHRkcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aI5LwcU6v12FsmqjZDfLSeQPryTNt/F/6G/vwb9Dnak=;
 b=O1eTJqCGUl3W8fnmtod4PHC9T0n+p9v7to8BAMWyOh6A/CItq183ZiY9w92y5nts6BQe9RMWVIg+xN3R+WF97RUV+0/mGPybyY3z4Se86vh2WyO/hqU5wE/BMA53ngENK49X4nUreIuJPLenkOkOagZhuvewlhcZ761azwlQoIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU2PR10MB7646.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:492::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.15; Mon, 6 Mar
 2023 08:43:25 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::914b:adde:72ff:b7c2]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::914b:adde:72ff:b7c2%4]) with mapi id 15.20.6178.014; Mon, 6 Mar 2023
 08:43:25 +0000
Message-ID: <50f7516d-0057-8c8e-654c-f9b1b4176588@kontron.de>
Date: Mon, 6 Mar 2023 09:43:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: IMX8MM: assign panel to mipi_dsi in a device tree
Content-Language: en-US
To: Patrick Boettcher <patrick.boettcher@posteo.de>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20230305162248.06ba45ab@yaise-pc1>
 <CAMty3ZA0m-CVdFsk5D55jEAkTCRPMbKo4YwzfKyrymM-98PO5A@mail.gmail.com>
 <20230305204555.293cd5e9@yaise-pc1>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230305204555.293cd5e9@yaise-pc1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::26) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU2PR10MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 9393f09e-9a49-4b42-efe2-08db1e1ed99b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aIyVE8aw7rCFvFvrMh1eUw6Ekr1zGWHZlp21cFc4MlDHGDtgNi/gDZbrHDsR/s8+JmJxJlNjkda7J0PDKBYWhqnfcYrn/0w13ZXBCHFqUtoO+TEwLUZN7u4Cyt9QoSVFe5Ws6vLgAcBevVIA1RKeiQj9kfs27HR4R3g7yk7hNkLbSC2Dakm/xbfOGCqHqJAQUskkFjmwCdC6Ivz9Lto+LMWCGoHtcZ8ZxLOdktmRvKO988sTWOZ9dDnUnSYqYAe75CPhoSCEhraTAObMtl3XQQiatNjkjw2xjjHf7lSKCffRJjrP2/4EdwDgAa96eiXxaCyNJ+L06AqFtYdLiB4qIQ1M3NEl57ayd7vqMqj3O+oedTDWu9KWccmoMPk+BE/NhPv/M9l/PHXppIsClDboH/U2P2wyJRU+lIneu+MLhCLYvQm4qHRE8WQEyp0MEU1SUa2uv2GXoPqMAe1RxJ7ViWI6LaC3G0ac9ZFrgUWqLG0ce9J3whZXsCcKrz+9uzI6vKry9dtu9UZ22TOyl4AwM4SEUur194Q03l+CjU0yGzBZJ4H52699ioceATmJSIHPXVu1R862pUuyZlI9rsWnqO+kz+igKhEMG5WIrrWDBaZFeKlvL1CMVtL6EiNZpXk8ZgMY8+ShBoBOE21gb4dsPGnE9thMUYCi4q1dBwqGxWZxcXnzrxAjNZLjJIGC1Q2lbq6F8OOn3IgJwLKR3MH4mR0Vnj3LCTZs/jQfpnwTJ8BtzTNodoFiwxpt6WDvGzbF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199018)(8936002)(31686004)(5660300002)(45080400002)(44832011)(66476007)(66946007)(66556008)(2906002)(8676002)(4326008)(110136005)(84970400001)(316002)(478600001)(36756003)(6666004)(6512007)(6506007)(966005)(6486002)(53546011)(66574015)(2616005)(41300700001)(31696002)(86362001)(83380400001)(186003)(38100700002)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEd6dnRNOGlNTDBEZ1laZEdyc3dneHlxMGtOS1dxZ3Fjcy9pWXRtVHVDTThv?=
 =?utf-8?B?MXFwS1JZbmh3QTR6SjE3YUlkS20wOHBpUmV6MGswVUprcGVGRTFGUzdYSnlh?=
 =?utf-8?B?cmJLTmx2eWtWR0lDamJXS1p2VlZ3SWpkTnNMU3pXY29ScFdJbjNEeTFGS2Ju?=
 =?utf-8?B?QlBpWEU2TVJtOUpSeU01eXc2TlgxUTFoSjAzbGdXMjV0bVBKa3dEUDBqdHlw?=
 =?utf-8?B?MFNqNE1KLzVQTGU1YnJNZFc5ekpRTWhQaFhjY1pvQ0F2VHZYZnpUeUt4UXc4?=
 =?utf-8?B?MXdSWmc5OEttRUFZU1ZaM1NNL0wrRGpPajRiWkhSSTdBRFFMUXdPQ1lYVkl6?=
 =?utf-8?B?SnJYaGVmcVJhK1hiTjJWTnVja1BVaU05T3lNUGtVNDcrREVTUlpUUWdFUVRW?=
 =?utf-8?B?Q0tld0F2ZzYzaEppWEFlT3h6d2R4dW90Y1MxNTNXWGFSWFJ4a3c5bEp2N1JZ?=
 =?utf-8?B?ZzhkUlVHVEFKa2lCZ2MzL0xQVm1oZXVOVVUxb2N3WHBWV2JuSnFvTVNoV05Q?=
 =?utf-8?B?L0p3eEEvbGxlek1vaFlNaWVrSGRZZXR4N1lKMU9udWdSeHJMaVJPRDBjdml2?=
 =?utf-8?B?Smo2dWFoZExEUDUwV3pOelBnUktGclZtbHlYOW0yQlh5RFMzZkl2dFMwczNT?=
 =?utf-8?B?Q1g4LzZVOVpKSUpHL1I2bEJhYXI5eWtKN1d6aGx5MVd2WEU4eWZoVlQyUWNR?=
 =?utf-8?B?UVlBdkMxWnpoazNtNUVnWnJqcVZQN1czcFhwcU1BRTVIdFoxaWExNi9reWo1?=
 =?utf-8?B?YWZueStyMFlkUE55aDkrRG53RmtQTnVaTVBYWUxpaHRHMExSZUtoVXJHeE54?=
 =?utf-8?B?bEF4Q3lyeVlEcHVoM2pMM2VSd0ZZYi9sTkN3REJrN1FWQTNFYzlTdGpkMFBr?=
 =?utf-8?B?SkUyYkZYQzNqbTl4aHk3Z09GTXBVaUZwQnEwbHVtNTFaS0IzTWVmOHdlenBi?=
 =?utf-8?B?TmFEeGVCdU02Y1dORytqK2dScExpakxBYnVIcGVtL2tkYXZwNnkrdHZmcGFC?=
 =?utf-8?B?ZVFCb3V1QzFHSDhoakVCM2U1WDJ4V1hLV0g0NTBwcnlUTXlBa3Iyd3I1R21Z?=
 =?utf-8?B?SzFQVzMxa2krVGpocG5yZGxaQjdRekl6a0MvSHdpU2doNlg0UzllSmZBR3FB?=
 =?utf-8?B?bENGOFN3T3pHQXd0NDNWZVpxaEJtcGJkbVdXS0ZDT0ZYQXZUbWNCeVpRYU9N?=
 =?utf-8?B?RzA0NUkxenRSVkU5UEF6bWdyajRSR3pWV25TcjhaQ0U5WlNHNDZGRDVETlln?=
 =?utf-8?B?WFltd3hraVo3S2V3K3ZLUHlGVkY5a2xqVytJWDdxQU5QYXhrMnhRbGdrYlFm?=
 =?utf-8?B?UWpMQlZIUWQ0cVpPNG1sV2pRc3U2K0wrYUhueEhwN29mZVZhMHF2UVRkanpm?=
 =?utf-8?B?eWhxSEJ0MytMVmp1bG9BRWJxdEdHb0dHczJ0OWRqck4zU3dWTGNFV2hQKzl4?=
 =?utf-8?B?eDFBTUhxRDFKRkhBenBabUxmTzlsZVUwWkJrUWYvU2N5OFhpeUhGQ3BHZ2VC?=
 =?utf-8?B?NHhmMWdFT2wrS2EvUWk3T2s0MFZLdFREcnRlYnBWc2NnSmt3bVlRaFdMTmNO?=
 =?utf-8?B?aFJjVkhEOGpRaDRGUVZnU0dLVUxxWk5IUlluN1FjQXJNbnZuWW1vcVVBRmxF?=
 =?utf-8?B?ZVdPYWRBOW5zRGtsRGpxa29BTVE2akUyU0RXb2tuSGUvZ3V3NHVIam5uL3d0?=
 =?utf-8?B?cG45VW1sYzZaaHRrYnc0YnlTUzNUMHlNdFdPNTdiT0h3aFVtNllRdDF0Ykty?=
 =?utf-8?B?cWdDdDUvT0hWZDNpY25neHNUUnFHYXBzYS9TempkelBmRC9IcWFRU1hDQStk?=
 =?utf-8?B?YjNMcjNLdS9CdjFGN1NFZW1VenEwN3VqRHRpL0lpVzJBSGthWkY4N3EzNmRr?=
 =?utf-8?B?UFc3Ynl0WGVvUjZET2dGdEN5bGoweEhNUG9sdERyUWFITVJFV0dWbExQSzJi?=
 =?utf-8?B?OEpCODNGWllxODVncC9STCtZdXloQi91NUM3Q1RhN0J6cTh5NzZJakFibnky?=
 =?utf-8?B?N0JHRjVLc2h5ZGJmM0svaEZPc0tuTVhZbFRLSUpsazJmcTlhNDhNTG4zUU1t?=
 =?utf-8?B?bHRVOGxnYXFMWnpSWVladTJYOVU5elpZMWpLUnBHUS9sc0R5Y0lFTXdIWENr?=
 =?utf-8?B?OHFjKzFnRGUzNDVsL0ZmL1hFYUN2NksyazNlMjhCOUZ0RDJYSWs5ckxocTN6?=
 =?utf-8?Q?zo8j+8EJIqL+6D9H4903ouvWK4CcUnVymy17Nje9uYS/?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9393f09e-9a49-4b42-efe2-08db1e1ed99b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 08:43:25.3033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ReMEYJcwg3vaLoNGQigaG2VHeiH29IUwPUijGci1de0L6B103TdPq89lx6ssyBHY6gQwnhTL/Ahsfu+Wb9xBQmu2GcfuSZxrqsTwQNHZfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7646
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.03.23 20:45, Patrick Boettcher wrote:
> [Sie erhalten nicht häufig E-Mails von patrick.boettcher@posteo.de. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Mon, 6 Mar 2023 00:05:03 +0530
> Jagan Teki <jagan@amarulasolutions.com> wrote:
> 
>> On Sun, Mar 5, 2023 at 11:39 PM Patrick Boettcher
>> <patrick.boettcher@posteo.de> wrote:
>>>
>>> Hi list,
>>>
>>> After several days of trying I realize my too small/old brain is
>>> unable to map around how to assign/connect a panel to the
>>> mipi_dsi-node in a device.
>>>
>>> We are using a 'tdo,tl070wsh30' panel connected to the
>>> mipi-dsi-interface of a imx8mm.
>>>
>>> Of all the references I found on the in public repositories none of
>>> them is using this exact panel. Well.
>>>
>>> Looking at other device trees I came up with the following dts-node
>>> add to the mipi_dsi-node:
>>>
>>> &mipi_dsi {
>>>         #address-cells = <1>;
>>>         #size-cells = <0>;
>>>         status = "okay";
>>>
>>>         port@0 {
>>>                 reg = <0>;
>>>                 mipi_dsi_panel0_out: endpoint {
>>>                         remote-endpoint = <&panel0_in>;
>>>                         attach-bridge;
>>>                 };
>>>         };
>>>
>>>         panel@0 {
>>>                 compatible = "tdo,tl070wsh30";
>>>                 reg = <0>;
>>>
>>>                 pinctrl-0 = <&pinctrl_mipi_dsi>;
>>>                 pinctrl-names = "default";
>>>                 reset-gpios = <&gpio4 4 GPIO_ACTIVE_LOW>;
>>>                 enable-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
>>>
>>>                 backlight = <&panel_gpio_backlight>;
>>>                 power-supply = <&panel_gpio_regulator>;
>>>
>>>                 dsi-lanes = <4>;
>>>
>>>                 video-mode = <0>;
>>>
>>>                 panel-width-mm = <157>;
>>>                 panel-height-mm = <86>;
>>>
>>>                 status = "okay";
>>>
>>>                 port {
>>>                         panel0_in: endpoint {
>>>                                 remote-endpoint
>>> =<&mipi_dsi_panel0_out>; };
>>>                 };
>>>         };
>>> };
>>>
>>>
>>> You'll see that I used the attach-bridge-option, which is maybe not
>>> necessary. I found this during a debug-print-session in the
>>> drm-bridge-driver, it wasn't attaching a bridge. But maybe I don't
>>> need a bridge as the panel-driver contains everything to control the
>>> controllers of the panel. I don't really know.
>>>
>>> However, with this I have the following messages:
>>>
>>> [    0.393985] [drm:drm_bridge_attach] *ERROR* failed to attach
>>> bridge /soc@0/bus@32c00000/mipi_dsi@32e10000 to encoder DSI-34: -19
>>> [    0.405626] imx_sec_dsim_drv 32e10000.mipi_dsi: Failed to attach
>>> bridge: 32e10000.mipi_dsi [    0.413974] imx_sec_dsim_drv
>>> 32e10000.mipi_dsi: failed to bind sec dsim bridge: -517
>>>
>>> The panel driver is never instantiated.
>>>
>>> I'm using 5.15.51 (-imx). mipi_dsi and the panel-driver are built
>>> into the kernel.
>>
>> Please share the source repo link?
> 
> I'm using this one (via yocto's recipe):
> 
>     github.com/nxp-imx/linux-imx.git, branch lf-5.15.y

This is the NXP vendor kernel which differs a lot from mainline,
especially in the graphics/display area. You probably won't get much
support from this list as most people here (including me) would advise
against using the vendor kernel at all.

> 
>> B/W if you may try the mainline
>> code base of imx8mm dsi please check here.
>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Fcommits%2Fimx8mm-dsi-v16&data=05%7C01%7Cfrieder.schrempf%40kontron.de%7Cecab86504a844ecbe8fb08db1dc80c14%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C638136517256300234%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=D2Ri4bUaPvkRCiuYWihOgC8PkGC8BGAVG9qnGhlBhEE%3D&reserved=0
> 
> Do you really think this is a kernel version problem not only an
> integration issue? I mean NXP's version is coming with device-tree's
> using panels, and, although I can't test, I believe they are working,
> aren't they?

Probably they are working and probably you can get your setup working,
too, somehow. But you would need to ask for help in the NXP community or
elsewhere. The other option is to switch to mainline (recommended) and
use Jagan's patches for DSIM support that are about to be upstreamed.
