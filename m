Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMoBCPimk2ly7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC001480ED
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D5810E402;
	Mon, 16 Feb 2026 23:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="owbB2FkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013002.outbound.protection.outlook.com
 [40.107.162.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFA810E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9124XHoqZH+G1fTYX9jaIet3KHeLvgnyDWpVYx1RuVDUk108jLFiZyYHpWfsk2S3JQQ96V/kWLKOltvZ/trK0xcihQ4QbtEWm7d5qeT/4SluPRn5vvaXrW7dGVU9Qkz/1X0hDOKlZZT1Lv9FBgm+iJL9YVbKXbZChAqFE7NzKIbncr+Nfcr3ijDMaM/ZGWXks3jn/uP9/J9jwo6l2trH+LVPANs4neIqtFB1DXCSjlKNp9GfSWGGf6g1KCYHksrYJLvCp8bPNMnCZaZHrcPY7SCD6nujqNwVR1hF9iZKF5WSwO1hNS9BxE7COIp+jAzdUd1q5VTtm2j8SXM6qS+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mnt5+7X2GLIR2F3r2Pj7eSoARXOGdp7PT4OZrcElXWg=;
 b=Mc3iK18CJMkYB7MUHoUzl3/dCI6myadbg+5QjahFQinYYs8vmlGDP9sUpJ9Cz385t0Ed0td7kmChUmeSNl/vExvApHkwr0EpANJIroTh4OXlc6pVS772LILg7QDkn+skT0hbEQKIQBUk80ZIRfwihu6LWTBdUr/X+Rixl0ApAUeHo5tRUdRr/8cFdkJz5Vw9ItnBrrVaTdsnUaczYJVqLrsnEdMZpI91gGgNoz/+Yt0je1MA2PldMkDz4tqVc3/UAMwnpZlmz99rVbzSzwpNVaIghU0RRu2UJk5Nhl8AJo4nYcG/sKGgmqvzw3zi9ksaWhO3Lrs6zdrRhWklmncEUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mnt5+7X2GLIR2F3r2Pj7eSoARXOGdp7PT4OZrcElXWg=;
 b=owbB2FkCfLWW73eznoym92Sj0Efd3xRoWRzDg7CIaDOORZkOn9Gcwp14z2h6aZmN9HL3NxgTC3QD5WDS1ZX0J20jCxnsX4SCxq51wv9SRuMORQiTwPBRPAYmk7ChuAiwrxA1oi46bgslcBzKaAjxm+Owy1HkqtKTT0mCFTzPDDttYSKLXkNs6d8SXd6opeMVEKsc0+9BDawr+K8cAd/RaUgRo/uoXTULtMSxBpCqlZS2Mh6txuRImMeuFGQJZAOHk52oZ4ZvjIIq1lE7bN6QQSh7j2twTsaERcKhhxYnVBsfE+WWvxSq9RJfbH744hRGeSWalujR0mdHIk0SrSoGiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by MRWPR04MB12380.eurprd04.prod.outlook.com (2603:10a6:501:83::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:20 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:20 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com, cosmin.stoica@nxp.com,
 adrian.nitu@freescale.com, stefan-gabriel.mirea@nxp.com,
 Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, jkangas@redhat.com,
 Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 04/13] serial: linflexuart: Correctly clear UARTSR in buffer
 mode
Date: Mon, 16 Feb 2026 16:01:56 +0100
Message-ID: <20260216150205.212318-5-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::20) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|MRWPR04MB12380:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a86d3c-dbb6-4325-4f36-08de6d6c61cf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEhiZUJhSXpNNFBBYU0wQzdRUDhPWndadExUazNSdEJRcWdEL0NUaGhlWW5h?=
 =?utf-8?B?c2hDUDY1MHJlWittVzErTmFaUHhkRU9SS3pKNzd2Tmd5NUtmRjRDSEJnZjlo?=
 =?utf-8?B?bnlKeW5vaGhzd2dudU9iVlcwMzFUZk8wTURQTVRpR1dXR0FYT0NRQlo3b1Ft?=
 =?utf-8?B?MHlTT21WNjh6ZU0rWktvZHdIazJTOTh3K1hsNmlUMmxqOSt1SkxVemZBbmFI?=
 =?utf-8?B?a3JEV2ZOZHFuRW5XMmtqNk5kdFRUdzRlZkJrbktyZm95bUhGd0g1VGcxaHlt?=
 =?utf-8?B?UlIvZ0FpOXBSUzMzN0pxbGozcjQ2eEhXVXByZGlsOXFmaFlEMWFhdmJzK2V6?=
 =?utf-8?B?YzVGUGFENllLdFRzV3prcFd4SGtxYnJySXdDYUM3cG1vUy9qTFJydDB4VUZQ?=
 =?utf-8?B?SVVVSWNzVGxISzhLYXRvOXVWS3kxMkdJNGNlL3ExWXgxQThPb1ZwSFB0NjF6?=
 =?utf-8?B?MjltL0lwODJUbXc3K1pkZGZvUUlsY3RqY0NacmJBODdhbUJIeFdKMHAzUDVY?=
 =?utf-8?B?Z2RkbmIzTElLZnRuaEZxSCtOMlI3OXZIWFM2b0RyaUg1aEpNNTVSSEpCVGdQ?=
 =?utf-8?B?VHNoUVVtK2x0NGJFQ1JFSmtmQ2lwcnhncnB4YkxTZ1dFRS9SckFwNmRhdEUz?=
 =?utf-8?B?enZIWk9XV0VIR0pKSlpYblRROFZ5M3VCd2RxdU84VU1ZTU56V1R6R0R0d3Qw?=
 =?utf-8?B?WDFSNTJRNUFyYmhrWGdrZnRVckErOHN6a2ZSNmxtV3BZYUU0VlhVV2krdFBh?=
 =?utf-8?B?MjNxRFNwdFJQV0R2VTAyc2ZvcVA3YytLYVhSWS9aM2VWTmVwcHc3MUdpWVUy?=
 =?utf-8?B?aE1ycnZ3RXgvVGJnZFp1MG9iV29vUTV4c3lOS2wzT2JyWEoycjVReTd2VzVV?=
 =?utf-8?B?elZxOWFPekZoYS9SUmFHYnZ5ZUlSbzljdkdHczcwZTV4MUVaSXBUd053Wmh3?=
 =?utf-8?B?SDQ4RTg2Uis1WmlSZHJPczZ6VXpBWStGL1liSDFaRm05ZmlNOXpWVDlJU2V5?=
 =?utf-8?B?ZVdDOS9XSmVPM3Vlc1Q1Q0t1TG9pcldlOUd4RWtDRGE0V3VqdVo5bGFYOWhx?=
 =?utf-8?B?dktkZ0REb0FNK1hHb0NQdkthVXlYWjhVTWxIUEEyaG1FTDJzWUJrQWJ2ajYx?=
 =?utf-8?B?d1BVcnBFYnF0MGMvYWN5QWVmWDcxVGRZMXdld3pxTWNxc1V5UFVmRkZRaHFw?=
 =?utf-8?B?a0NIVG10R2RyY2wyWTVXN3ZrS3hjVWxkUGM2enIzRlltSEs5a2FOM0JXbmo2?=
 =?utf-8?B?SURyb3VFcmM1ZmZkbFYwalp3ZkNadE05T2srdThGUXJWMGZ1OE11M3AzcWF2?=
 =?utf-8?B?d3RYVlcxM3NiUWR0NE5Zc1RlWll6c3IzeDhQV2NMR3F3YVB2R2lRbVpqQ3ds?=
 =?utf-8?B?cy9nbXNuaVllVmt6RktKYWVrZHBISU9FSzlnNHlsdEF5ZGwwYlhRc2VlTTZ5?=
 =?utf-8?B?ZmtnUEZIN3krbDY2MjVhYUNFeW9jRE5mTFpxNmcwS3ZPYW43Q0wycW1wb2JL?=
 =?utf-8?B?MWxBdkVpNHNaRXRpNjBKNlo3UXhONTVoa1NJdUZkYXl5UWtnZkVucG1qYkh4?=
 =?utf-8?B?ejNEM1gyNS9wOHVmZTNYekNFbUQ1cThwbFpucGxMSUxKMk9OR29JR2doSWVH?=
 =?utf-8?B?VUtDVTBSSnJmRk45bjFqeC9GZ3B6eHNIUHhBOG9ibjhUSWRkNklnbG5oRmp6?=
 =?utf-8?B?b0haTk1mMHBQVkN6UzNvYncxc2Y4MHVGNXRPbW8vNXB3M1ZBZzZsWlVqa0tI?=
 =?utf-8?B?VzFPb29wZVRsZURQMndjTjNPUkdsdlVSaURMVWU5dW1XT1ZNWWx1N0QvZ29K?=
 =?utf-8?B?cTNEeFJuclpSSDlXb2x4VWFMSFN0NkxvTzFpZ3cvY0ZKSDdkbEd1VE9HZzFv?=
 =?utf-8?B?cGpKRWlkYXNUL3BVOGZVTmVZTnpGUktuUzhEWnFBV21WU1dHTldicXNsWk1I?=
 =?utf-8?B?QS9LajdnQ3kxWS8vY0plVFFPNDhCZW42UEU2bmN2QXBKRHE1ajZuRUh0OHRG?=
 =?utf-8?B?SlM1N3NzZlBSa015YXpKdVk1K1RHQUpjcEdXaWFMcUpId2RMdWdpaGhqd25S?=
 =?utf-8?B?dTc1Y0UwY1Z0WVczZ3RVU2FneWN3b1VFaVQrZTl5L1lnTnZ6TmxGMXZiQmlU?=
 =?utf-8?B?VVZ6aUFSdjRNOTZFdk5ESWdjZWJ3U1dObGZxbkcvZitMdlVkNVJxbEhVVHU2?=
 =?utf-8?B?SUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9224.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0E0VXdjaFFZenEvVHdaVWJLQzEvUmR5OVpQTFlpOVo5UTRHeFUrZE5xbGtJ?=
 =?utf-8?B?R3I3b1g5aFEvRTdRcUQxTUltUzZXcjVtYWZtSE1rYXlqUEVmN25VMXYrL2x3?=
 =?utf-8?B?SlpuWHJrL3RqV0lnVmpPSTgxZzRUaUh5emw1VU41YzJEdTMwL0xpUlE2a3Fw?=
 =?utf-8?B?aWhia0dJSXVyK2xmUlhTZ2NSMHU1cTJzNmlUUkdaUVRkYy8xMUM2YmdBMGdi?=
 =?utf-8?B?amVCekdNaHFabExFSDRWQkRuVGpJWlNpYVFuQW9ZMlg4SStvUGhucU00THhP?=
 =?utf-8?B?Mk9QWGcvUlMvbjNOUUdZVUVTcUhDZ3VDWWdSOFhPRDlhbXdlTS9RN3VvU2VE?=
 =?utf-8?B?NGEvcEJpcDIyWTdkTGRQN2o5YzFpNFJzak1qanN5SllEd0YxWm8xQXN3K1g5?=
 =?utf-8?B?RW1NTENvT3l6YnFrQ1E0Q3ZTOHJtbCt3SE9GL09DdlFWVDQwcHF1R1RMSCtT?=
 =?utf-8?B?eWdvV3AvdFJ4SUluVDRRcnFCZDFlUjhFRi85cUFZcWErVlgzNGdpR0VXb3dD?=
 =?utf-8?B?N3FDbVcvRGdpNCs0WUhIZUhqMVh3d1lPeEI3WC9HZUtCU0x2K1lHT25za05P?=
 =?utf-8?B?V1ZRZTJzN3ByMEtUc3QxZUczRE5wckt1VFRERldNdXFJK2NsM3F2NjdLcUp4?=
 =?utf-8?B?YWVjQitla3hCSFJ2ZUs4c2l3RURpY1diTm1RY0tpYW1wYlRYSUxvekFzbURw?=
 =?utf-8?B?b2FjWXk5NmdaMjd3VTVBRko4RmpPMjJCOHRneXpreFAxdjR4UHM2R0NnVUQ0?=
 =?utf-8?B?ZjBnY1MyNEErNU5sNklJNEdZQ1VNMkRqN05jSVo5T2JRbGU4bk4rZ2diOVRw?=
 =?utf-8?B?YktPb1U2c3BXRFM2aGt5VjdPWjFKa2w0UVFBcDUxbjQvRGg2WjBxZXBMQS8y?=
 =?utf-8?B?enpaUFZvdVRvOXp1RS9xdmp5c0JwU05uUDN2aGFhc04vckt4TDNVcHpuWFpR?=
 =?utf-8?B?TGFheHV5OElKWk0rOUV4cUMxU0NGREtiODVOaTBtRGNGQ2ljOXk1T2lqM0pv?=
 =?utf-8?B?ZFNqeHZSSnBDdzdTOEF0bFk5bVRoTStFR3pveUZkQnJNRFVzSUZENWJSMmVn?=
 =?utf-8?B?VWZpWEg0eGd2M0dPSDJvMzJ2WjB2TWtiRnFlOEtlTTAvcDFCWkQ2aXRERW5h?=
 =?utf-8?B?SWdZb2tuTjZaOHY3ektUSWFIU1lRV1NjU1ZBNVluRkk2RW93WE02UzJRMW5r?=
 =?utf-8?B?STZKazBKbFgvdTJBMmRFZmxxQ3AyK3IyREdIakpxbUw4ZTJSK0d4Q2MzdWRI?=
 =?utf-8?B?ZmRiSWwrYTdKSDJ5TnQ3Y09RbTFKVS8zc2VBak5vM2NETWh0b20yMVF3N2V5?=
 =?utf-8?B?d2hmR3IrS2ljeXlTM215cFJHRXdoNDZFblZocWR1dU5zV2tlNW9BNVFvNmFM?=
 =?utf-8?B?SGxCYkV5V2RDS1FNTzNzUWxaRkNaWkxGTEVFQ0JxcjVTZTVXQnB3UVhpQ25w?=
 =?utf-8?B?Zkh4cjF0KzJPZ3VZSVl1dnJnMTkrdDRuMC9FOUxvL2hMY3FzcjNETTFKK05G?=
 =?utf-8?B?TmxPbDVVWXh1WDZjM1dzNzlBdGtmdDBUSWhRZzlnWU1ONGJCZGI4a00yYUFM?=
 =?utf-8?B?VjVTdTlrTTErZ0hPU2N0bmxLMlMyajlxcEhmai9RbklTazNOaHlGcnB5dVRG?=
 =?utf-8?B?Q3JMNmpleGszczdrQzhYL3BaUzlBdmdwVVRzWTlDc1YvQWtzSWVYZXdHVWdQ?=
 =?utf-8?B?anZQVlRXTWJxU1dXY3E2UEJCTmR5dGxxSzJvbGtydFBRSnpQcUJIRDFYVGFC?=
 =?utf-8?B?cGZ5TkNyRUNWUm0xS0R4RDRseVhBRFUrMFJRV0pMS0VIc3A0ZkJWU3NURU5N?=
 =?utf-8?B?RXA3NGVSYjJrRG9ENUhHUEk2ckZ5TVB0U25rc2xmRVRpbW83KzNsN2Rxa0ZZ?=
 =?utf-8?B?Z1dqOXhhR0lEUVFVbnRmQXFCOU5qQjF0Mk9lS1VjTTNadzgxMUdSaUp6d21V?=
 =?utf-8?B?VGxYelZWQ2RFd29TWkdrM3FFRWJpMmNFTlJ1cFFwdnJxSlJRYTMzK21MRkxu?=
 =?utf-8?B?bVA0SFZjMnlFZDdOWlhyc2Y1NFp2aEt2S1MrUVYza2tnMzhGVUNiMFVrK2Rt?=
 =?utf-8?B?T1NIbTN2MnRsN0ZLbTM2ajFyeXlyaEFZM1dMMWY4VWlvcU1sQy9aS1hkM2xT?=
 =?utf-8?B?cDYzSnBtZkV0RjFmYzdSMVVYYjYxb3E0VHZ3VDQ1YnVEdFptTUVTUVcveFNX?=
 =?utf-8?B?ZU10ZEtrNG84bk91Vng0TDA5bUtreElHZkZyQmZkN2hrM3doaElnWGNuNkYz?=
 =?utf-8?B?SkRyWkVadUxJNmxZaHlWdTBlbUdWYXM5L1BvbWxoU0NXU2ZuOFFVWEhqbDlN?=
 =?utf-8?B?ZUxuc3dZR1ZSNTlsbnZhSVZGakppM2NSQS9WNEhXZ2F4eTNkNzNISEZjc0Zv?=
 =?utf-8?Q?a6/naGOXsyXHBE4A=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a86d3c-dbb6-4325-4f36-08de6d6c61cf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:20.2117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2ulPlKYd/ON/UkNC7oY11bAyvoz1QxBLMtswVooKe447bWrhlmSGI41ZZbsgD6T7s3wlEoe5eJcAQ8p6o0QwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12380
X-Mailman-Approved-At: Mon, 16 Feb 2026 23:23:19 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:larisa.grigore@oss.nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8FC001480ED
X-Rspamd-Action: no action

The TX interrupt handler should not clear RX-related fields in UARTSR,
and vice versa.
The handler checks UARTSR.DRFRFE before invoking linflex_rxint, and
UARTSR.DTFTFF before invoking linflex_txint.
Incorrectly clearing these bits may cause the interrupt handler to miss
characters.
Same applies to linflex_console_putchar which should clear only
UARTSR.DTFTFF.

Fixes: 09864c1cdf5c ("tty: serial: Add linflexuart driver for S32V234")
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index 9111e7af62ea..a48240b0a5f2 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -169,7 +169,7 @@ static void linflex_put_char(struct uart_port *sport, unsigned char c)
 				LINFLEXD_UARTSR_DTFTFF)
 		;
 
-	writel(status | LINFLEXD_UARTSR_DTFTFF, sport->membase + UARTSR);
+	writel(LINFLEXD_UARTSR_DTFTFF, sport->membase + UARTSR);
 }
 
 static inline void linflex_transmit_buffer(struct uart_port *sport)
@@ -255,7 +255,8 @@ static irqreturn_t linflex_rxint(int irq, void *dev_id)
 				sport->icount.parity++;
 		}
 
-		writel(status, sport->membase + UARTSR);
+
+		writel(~(u32)LINFLEXD_UARTSR_DTFTFF, sport->membase + UARTSR);
 		status = readl(sport->membase + UARTSR);
 
 		if (brk) {
@@ -573,9 +574,7 @@ static void linflex_console_putchar(struct uart_port *port, unsigned char ch)
 				!= LINFLEXD_UARTSR_DTFTFF)
 			;
 
-		writel((readl(port->membase + UARTSR) |
-					LINFLEXD_UARTSR_DTFTFF),
-					port->membase + UARTSR);
+		writel(LINFLEXD_UARTSR_DTFTFF, port->membase + UARTSR);
 	}
 }
 
-- 
2.47.0

