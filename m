Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8C23677FC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 05:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621436E067;
	Thu, 22 Apr 2021 03:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B98D6E03C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 03:33:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JE6reM9kj7vNjfSfPiuyl5vd+7QCkLR/ADWC2ZmmDb24EJN3WaVNtCk94AqQL535PfLM4CTkRZtQZLUtbzDsVMgqlYGFCTBf7BhnyfxfPVXmY9jtmMPPikkPGsXdmJhYntnJPWXhle2PwlCymybkZxXct9za1mu/e2MY7jrtOHT7cGIU3sQlHyqfnRpiW8HHf5iyTKvORNu/RObzPEA/dRDALBNZnnSOfY4I/11WykFXRgrxDxP7o1AyksOPsZ2qudRQmCzccKw1fUEvUmR2EnKWU2LGg+heYgRrAht0pfZsmjUAkcI0ToBsuevIb+LLDvi1TQzbb4r9LEmewyab4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o03vfC+4NXzUr0PHV++OJDwB3OIuaNMObXIfMV2ySFM=;
 b=UN9IHsywbxfSJg7sX5FidcD2/mwgQ+cDSbI/SOTLYqwXwjJrI0V0CQ2a0RcVmJyA4Df0uHGIfP9uI+2qZXo75/OUcznzQk/FqheukeAeJKd0uXAPm1G48ntDKX5q3y/5KfdDqqHBX7ZMKbOkWOmPe2mYbq3CjmpkN5nqp/K2CUHlJuzredKEyBORYGQGKb9ZbYUY36pDzgTlL5baGFHPLnLBFMYhiWuc6pN7k8sqrwAV0jpjMFSURwlk2ld8MORyCHnQGTwR+cQPTSjQWZyYAYvu3K8aDROTN9lCCSt7pcjlt9081ZpI1HwfL6Ev9Jb+IxxZoKP2IM6OgwXgzfzpwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o03vfC+4NXzUr0PHV++OJDwB3OIuaNMObXIfMV2ySFM=;
 b=qGlbIL9uRBQiHJ5dbu3hIB5LiStDj0ziod7c5N4KdJR5CvXyjSoIBGlU/XzCw1AO4qh0XwFyhQSB/d7+YXyx5by7kAjxqaTPV9zLypNrEpcXB4x0OvLX8d4kZNTD2E4aaNWdJfdheyzpOcs6mVerJNNcHg1NITj4b+ynC9o2Aac=
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com (20.179.235.153) by
 VI1PR04MB4733.eurprd04.prod.outlook.com (20.177.51.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.24; Thu, 22 Apr 2021 03:33:33 +0000
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::de2:8b2:852b:6eca]) by VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::de2:8b2:852b:6eca%7]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 03:33:33 +0000
From: Robin Gong <yibin.gong@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Shengjiu Wang
 <shengjiu.wang@gmail.com>
Subject: RE: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
Thread-Topic: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in
 probe
Thread-Index: AQHWLcMcvbp0uyGgYk605EKKtgH/8aivLYuAgAF2HACAABbKAIIDgX+QgAHvdICAAJqQwIAG4DOAgAHNh+CAAAv2AIABkvaQgAA9gACAAIks0A==
Date: Thu, 22 Apr 2021 03:33:32 +0000
Message-ID: <VE1PR04MB6688F1C65295C1A0D689C5A289469@VE1PR04MB6688.eurprd04.prod.outlook.com>
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <VE1PR04MB66387217EDE5133FD2D8F793894E9@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <50ef17a2d57b022c48bbca71fd4e074cc3ca9be5.camel@pengutronix.de>
 <VE1PR04MB6638EE85485768351755557B89499@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <97262466d537402ad4032098ef277d6d47734f1f.camel@pengutronix.de>
 <VE1PR04MB6638659EC8557D01861042B189489@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <d8d084aa7ff183e2f78128a46a0ce5241f357c9a.camel@pengutronix.de>
 <VE1PR04MB66887C731E32BDBB340B044C89479@VE1PR04MB6688.eurprd04.prod.outlook.com>
 <18fbdc4bf0574a722134400ad9e4510d3cbcb767.camel@pengutronix.de>
In-Reply-To: <18fbdc4bf0574a722134400ad9e4510d3cbcb767.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7698a4c-fc54-4ba8-fc53-08d9053f67c6
x-ms-traffictypediagnostic: VI1PR04MB4733:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB47336C17EFA022581A71AA2089469@VI1PR04MB4733.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8NYef9/JSyHTn5YNuNNNtjVHxwzz1eI/y3DFt9duHjinAATnWug6nGAiNBfOo0gOapOghvi45JxFFH8uruLi7JXwDT1jq+/3/S++id8e+5Wc06zFXE5f0eKT4bgSHXIdMYu67HHOkHo+lQJzUXONYpYdnrUtU8QDMSd8L2d+cyZl1XhGZQDsMhcVHxi3vRdQibS2qhsDQLB9PEPIk2fxJ4cA8VyRbQVKbwWKcFkXa8SOOJJCIVIUNfARbN1GNl0XY2SRnoEjflznt7oSGzXbcg+z/tZtlBVEX/EhyhKH4Z61dL6kQHYP5rzCiGCCA5Nkuf1RWxCwnYktrMz2rkglY/2sPpI0mNugkH3U6ru2RmiVCnJFLIE0MEpv0fb0UDTbCCfN8fSlcAcSN+dC9aXMbquoMpru5ehdIEThepDryZC5L5ZawPlCAuQBYtrMvSPs9myEXQ70SVo+ThEGxSN4/cgkolHztJYnWfHKg0WtiwQpOS16fOJh1XLBiIaMNDCZrQDA8hDfHNL2JL+uRGFYQteYUbwT57Q1p8KYCd7JxiRCCsVfP2gZpPJMP9rLopzAz2fpdBRFCNtRG19pJ8fHxyVT67cf6Wo9lr5dSJ8Ml4E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6688.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(478600001)(6506007)(71200400001)(26005)(86362001)(38100700002)(54906003)(8936002)(33656002)(8676002)(83380400001)(186003)(110136005)(5660300002)(122000001)(66476007)(76116006)(66556008)(4326008)(7416002)(66446008)(55016002)(66946007)(64756008)(316002)(9686003)(52536014)(7696005)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dVYyQlk5WFcvUE5WSkVKemRYam9paFkxbWFGLzhMS01aMFROWURiZDNqMGNi?=
 =?utf-8?B?bWJxbThhSml0ZDhlOTdHUmFSNEsweExFemhQcjh3ODFoRm5INXlnYUh4b1Jr?=
 =?utf-8?B?blAyRC9mbTMwNWZEUGpEVmFQSDJrdFVleWhkQWdYS3hEWFZ2elpCWWhLeE4w?=
 =?utf-8?B?Q21iUU16WVpjTTdkZWJWMTBFVCtteW9xYzduRHlUcXYycEtZNzRLVFZjaTB2?=
 =?utf-8?B?RFdsWnRvZUxEdStBSWNWSEhxRkMwTktDcHdWb3UvNlY0Uk9mL1hVRDkreFFD?=
 =?utf-8?B?dm0vUkRMdklGNWJUVmhva0lzaitRMktPWDJrakpzUXpiWVl2QkNFRXk2MFdx?=
 =?utf-8?B?RzQyQmFZTEhZS2NUUlZiaHl6V1VVWWprSzRDbXd3bWxobVNwcHREbHVycHJY?=
 =?utf-8?B?VGJJWU9wSWlETlVqbW1GSDlseExKMTltYy95WjJaRUROYjdhMHg5eXlBRHNI?=
 =?utf-8?B?bEVrelZQRkdKUXRydEVtNXM4TjU4R1NlMFFjcldBeis2Rm5KamZTY1V5ZkZW?=
 =?utf-8?B?akNsdU4rVEkwanJEbFB6bjNWdmRrN29jTjZNWHl6MEF0YlhUTjNCZXZSSWVn?=
 =?utf-8?B?d2M1Zm1BQ2FqaEVhM2FkWFd3QmF0RldkQTZoanJ1aUMzM1o1ampFTUZpREJr?=
 =?utf-8?B?SmVPaWtEbTgvK2FFdEduNXlBRlhJUmFyelN3RWRWb2IrTUZ5WERDM0VEWk9v?=
 =?utf-8?B?UzZtZHNIT1VQUDdUOUc4YzB1M2g0ODNsbllUbkRpSi9xaHlZSzVNS3hQcXhD?=
 =?utf-8?B?T3JRS1M1UWRSaVlWQzgyc3FRRUR1cWVjM0Q5dkpJc094Q1NvREl5N2tKUmZ0?=
 =?utf-8?B?MEhEd0Y5NU5KcFZ2WVNqMXNuVS9taXVFZ3ltOGNod2pZejZ4U0JnaVM5eXkx?=
 =?utf-8?B?UGVmc1RmM1F1WExrb3Bod3NEdXFuOWNJWHBNOU9PWHk1OFdTU29LdnduS3cz?=
 =?utf-8?B?a0hIdk9Hb0xUdkovNGU5ZmlWdEJZaHZmUzIyS1dxUjEzQmlEa3ZIOXZLNkFN?=
 =?utf-8?B?Q011REhIV204NEUxb3lNNzl4enZQNkVvSWNOMFVOaFNDZHRpQ1l0ZEtoNVZR?=
 =?utf-8?B?QVJ0QlhTWGI4Sm5vUXF1TkFVR3dSay83WWNpSFZpOGhnWmlrWHBYK1ZhUURV?=
 =?utf-8?B?MTY3UW5QS3JRdVNDR1R4bmIySzM1dktmMzlKZkl2TTNtbWRDeTc1aFRxeFhX?=
 =?utf-8?B?d0hUcW0ySk1VWUpVYU55cU5NSkxIUENGZ011ZHRGZURsRGJEOUdjaTJwZmNU?=
 =?utf-8?B?NFcvYm5pRFFvR1N0T1ZKa2oxZlh2OGtSdFRiSktpd0NKcjc3Rk5BMksrM3I4?=
 =?utf-8?B?OGRxLzdVTkhoWDF5TmJMZjRMbm92cCtCMUM3NFRudk1QOGZ0SEtIZmlaWWYw?=
 =?utf-8?B?RDd5WHliS0hSci9FaWpZYThxTlJ6ekV3NkMxVEFwbHp5YVZUVGpSbUF1dnpI?=
 =?utf-8?B?ekw2UVJzUW5wUEMvc0thQ0FhZlRSeUUyMUZ1TVBieGh1dU9XN3Jzb3h6OG5W?=
 =?utf-8?B?SC9Sd0NXN0M1RURZaVJVelpZVisxNmYwZ2wwcHlMOWx6RlQvSWlzY3B5R21i?=
 =?utf-8?B?a0lHOUxwWFFPTy96bkhhQlNQSUtZWHMyRzN3WkROa1hiOE5hc3YvVTlpcjZW?=
 =?utf-8?B?REZQak5uU0s1SS83bnhzbjZuWThPOE9VR0ppOFNqR1oweDVweTBzMTRqQjZW?=
 =?utf-8?B?a1BJd0phVWx3d0w1anNvMmtpZWFYc3pjZGZSVmZuTmpibTFFTUhacUpZUkJq?=
 =?utf-8?Q?H9KEyx0HJWJjx8v2hRq7SPrE+KwOOCC5e/CtzXL?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7698a4c-fc54-4ba8-fc53-08d9053f67c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2021 03:33:33.0369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRNocrvJrpVhgdQz0MnWUuHlv0/0Hui0f9cCAp0kWdvMJISOPcOgPDqlmuIc8PAclL56q0X8WqSZuEg45OjmIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4733
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "perex@perex.cz" <perex@perex.cz>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021/04/22 Lucas Stach <l.stach@pengutronix.de> wrote:
> > But the timer of runtime_auto_suspend decide when enter runtime
> > suspend rather than hardware, while transfer data size and transfer
> > rate on IP bus decide when the dma interrupt happen.
> >
> But it isn't the hardware that decides to drop the rpm refcount to 0 and
> starting the autosuspend timer, it's the driver.
Yes, driver should keep rpm refcount never to 0 in such case. But I think that case
Is a common case in dma cyclic with runtime_auto_suspend, so some dma driver
also add pm_runtime_get_sync/ pm_runtime_put_autosuspend in interrupt handler
like qcom/bam_dma.c for safe rather than only pm_runtime_mark_last_busy().

> 
> >  Generally, we can call pm_runtime_get_sync(fsl_chan->dev)/
> > pm_runtime_mark_last_busy in interrupt handler to hope the
> > runtime_auto_suspend timer expiry later than interrupt coming, but if
> > the transfer data size is larger in cyclic and transfer rate is very
> > slow like 115200 or lower on uart, the fix autosuspend timer
> > 100ms/200ms maybe not enough, hence, runtime suspend may execute
> > meanwhile the dma interrupt maybe triggered and caught by GIC(but
> > interrupt handler prevent by spin_lock_irqsave in pm_suspend_timer_fn() ),
> and then interrupt handler start to run after runtime suspend.
> 
> If your driver code drops the rpm refcount to 0 and starts the autosuspend
> timer while a cyclic transfer is still in flight this is clearly a bug. Autosuspend is
> not there to paper over driver bugs, but to amortize cost of actually
> suspending and resuming the hardware. Your driver code must still work even
> if the timeout is 0, i.e. the hardware is immediately suspended after you drop
> the rpm refcount to 0.
> 
> If you still have transfers queued/in-flight the driver code must keep a rpm
> reference.
Yes, that's what I said for fix before as below.
'I have a simple workaround that disable runtime suspend in issue_pending worker by
calling pm_runtime_forbid() and then enable runtime auto suspend in dmaengine_terminate_all
so that we could easily regard that edma channel is always in runtime resume between
issue_pending and channel terminated and ignore the above interrupt handler/scu-pd limitation' 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
