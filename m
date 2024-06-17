Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4C190B82B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 19:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC5910E47C;
	Mon, 17 Jun 2024 17:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=garmin.com header.i=@garmin.com header.b="jUnz49WB";
	dkim=pass (2048-bit key; unprotected) header.d=garmin.com header.i=@garmin.com header.b="D/d9FHgT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com
 [205.220.177.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB1E10E47C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 17:36:46 +0000 (UTC)
Received: from pps.filterd (m0220299.ppops.net [127.0.0.1])
 by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HENA6l015085;
 Mon, 17 Jun 2024 12:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps1; bh=SxfN+
 wHjiTvQyqJr9oSfNdqU8zEfKD1AaQJcuPMMtLw=; b=jUnz49WB7LfzcqDcEbxCr
 Fm32HM/oVPJIk1AJANG2lIN+ObJh4QyLERdwZFAmXHhX9zPEdlPawpCLEJEhxio7
 +ZlZnzbtteHbzwnL8LAeVk0jmsGqcTJMZWeP0SoOtah7lNWbXX26VMQMTFuWJzGA
 J6HYiijKEhs4Nqn3S9UkkgGXpfIAbSxOv0oUVF/2wJLy0oDqbEaai3z143GOgQBd
 P7U7wduidvomYpihPDxDqwKhhaTfUxHhSUggOVUosC2C/kzQxaGM0B/WvQ3voih0
 YEhu0J4e+nNdq4XI2GuEXu1qySgtPjd0/u5v+CeyqrMWYkHDPJzhWNaSNH+3PERA
 A==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3ytkcp0sky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jun 2024 12:36:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7mKbhD2QyOpqEOYUtiFe8W2DlpZ+BNri4DW/O9bMogT522ZvIfpQfcHkpCRVN9642/z6VAHBMalZI8iaW5zz7cfEDeUJz/AE7bAkzUBDRmsI8myOxLcrL8jwCgC958cMwOsos6/sdDVNxhms/jlskWm/315woQmutyBTn/3b+szfpNu/i94eaFW7clyGbmPDWZchipqWFD2tBKajZ//VZKCynNiHj/udI7e5kyRSXed9cIdjsMWkmJA0uU9QfEA1yS7c1fEuLYInocDQt8UkbZN4a7/hm1ec4S4ydOBycDujKNjRncwon4+DQmdY804k084dNh4edoh9YDTPLPVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxfN+wHjiTvQyqJr9oSfNdqU8zEfKD1AaQJcuPMMtLw=;
 b=LZ57vN/TqgD67s+16AWVCMxkQKCq45pACcM0i57scRTEa78vjFY9w8knXpogItbIPoGEfAPWQa86r8Nr1RpLho6/ZQtgVCtXi8j1zMgeN1sWoVAidTUUzvH8czlcN33Q0s9Yat53Pvm+Tmwr7jxJy98uxY2umSQmMadx1m/GRJvoOJTB/nQaeE+oj1ghEJ3blcYDVLrXjHwFnvFW6cvQn+L66116YxAvAHRGWE1+tOl3jXEJhHfI6Uj/mumc3Lhm7HgH7MNG6UbCoONtZKyD0JuicihB6ydqMa+l+NwRbRsn2Uh29K/bU4muP04MLX7jaDFQYXkPBeYfyiSoE6Clpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garmin.com; dmarc=pass action=none header.from=garmin.com;
 dkim=pass header.d=garmin.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxfN+wHjiTvQyqJr9oSfNdqU8zEfKD1AaQJcuPMMtLw=;
 b=D/d9FHgTKp8FYej1S6uGRN76LTcXExaLxF43s9j7GFpwic/gddzxjVb555Cyi7/FmhBCFS6ZN2e+tTD74Jw+Ei2qXEFUtEuTaQP1+Jw17kszYWQ4SI2NICSviZdqtcH5lUaHsGR6CuCaKTjyZklougIzwv9Akyvduzt9wYRbtchow5yec3imx6VFEPXS0fs0EU8eSRoBerVVuRkVZb8JRnQ/PuFw44OtfeC3zjCI3LF6iQhbeLOc9XcJhAUP4McFya6L/Vn+y9zlzYfGgENIRJtInZojbf9zFl4kdcsw88NRDg4jdrFIWNv/6XjweI09LMA0QgWWo9Z8OLfRFdeK1A==
Received: from DM6PR04MB5178.namprd04.prod.outlook.com (2603:10b6:5:10d::23)
 by CH3PR04MB8875.namprd04.prod.outlook.com (2603:10b6:610:169::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 17:36:34 +0000
Received: from DM6PR04MB5178.namprd04.prod.outlook.com
 ([fe80::c2d5:c293:4896:b5a4]) by DM6PR04MB5178.namprd04.prod.outlook.com
 ([fe80::c2d5:c293:4896:b5a4%2]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 17:36:34 +0000
From: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
To: Brian Starkey <brian.starkey@arm.com>, Daniel Vetter <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Pekka
 Paalanen <pekka.paalanen@collabora.com>, "nd@arm.com" <nd@arm.com>
Subject: RE: Correct sequencing of usage of DRM writeback connector
Thread-Topic: Correct sequencing of usage of DRM writeback connector
Thread-Index: AdrAusI9x3tDcCHnRSWudKoz72ltVAADpXcAAANqGgAAAPYugA==
Date: Mon, 17 Jun 2024 17:36:34 +0000
Message-ID: <DM6PR04MB517866DC4DDCD418DF3CE0F3ECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
References: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
 <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
 <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
In-Reply-To: <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ActionId=a339c5a3-564d-4c24-acb3-d2e61bc199ed;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ContentBits=0;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=true;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Method=Standard;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Name=f3ff6d80-3782-4df6-bf6c-659f84558040;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SetDate=2024-06-17T17:21:54Z;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SiteId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR04MB5178:EE_|CH3PR04MB8875:EE_
x-ms-office365-filtering-correlation-id: d318d55d-6f38-41e0-a8f4-08dc8ef40872
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?R2dvZjVuTkxuYkhISmIwdXBrT0FLUmIzZlZCUnZLZm1pTU5kMmxhSnlJRm1y?=
 =?utf-8?B?Z3NreGF3L0g0Sm9pTkVzWnd5eHkyOE9ydHE2V0t5VjRTWVRRUC9FNlBQTzJE?=
 =?utf-8?B?WlRacXg1Qm16enk4aEVYR3VSS0llOGMyZlYxNS9kQ2ZpR2lLS1Z5cHREdVFE?=
 =?utf-8?B?UCs5ZHUwQmlMVEx3RVpyODVLeTJMeWR5MU1TOHd6dVNFcmtXTTBPSms1ZU15?=
 =?utf-8?B?bUxaWENBRDBFcE5WZ0JGQnRndnViQ2hKeC9iWmlsVE82MmRSdHlLMXphdlZz?=
 =?utf-8?B?QWxCZU9MVU9RU04wNFBralF1U2ljU0lScDcwenVGRVJ6Vk1mSDREUHdwNU9M?=
 =?utf-8?B?RFdNeXdvNmxLVk90bmpYVGRVd2lsSEtPMHo2MHFUSGJQak9CaDluaCtQNUkv?=
 =?utf-8?B?NDdZeGpzdzdEWG1vcnBCZmVYRjA2T0JwTzlSVVNlK1hNQVNWTXNKWC9oYWJw?=
 =?utf-8?B?UE5WaWMwdGhrVk93eS9mcDBScDlPam8wQUtlWWY2MWt4UWRHbk9DYTdSTXNY?=
 =?utf-8?B?YzY3QjlHc09MdHhwcnNRMThUOElaRmMrdUhRQnpESWNSREVXc2ZWY2xYK2hI?=
 =?utf-8?B?a29oSUkwb09FbmUrckpsWU4wSjJYYTNNclhTMEMzdVlETFQ0SVE5K0xSYTc3?=
 =?utf-8?B?WnhaeHdUOENURG5XUGczTGg5cU1MQ2hTNmplZDFja0tTQnlmS1NNbExNbjRh?=
 =?utf-8?B?MC9ZTDZvNURxdEpXZzV5cG4ya1lpYnFCWkk2aEZjQlVRbTExL0Z1NzI3YjhS?=
 =?utf-8?B?bSt4SU5rV3N3K25mZE1mSlFKeEpyUlRlZ1BMOUpmTTBuU1FLR3VDaVVEOXA2?=
 =?utf-8?B?L05Ubll6MnJyVHpLMWNBRiszcjFJT3NabHo3TmNISmdiMEZzVzg3TnAzN3cv?=
 =?utf-8?B?dTN1aUQ3THhUZXpqVTJaYVFBRE1DSjJoSVFvRm9CamZoNE9VWFRZOFQ5MVFz?=
 =?utf-8?B?eEFra0VTRGIvYytOb3hBd2N6bmsvT085bUtsSjFtNmROdERkVXF2NWdrbXVM?=
 =?utf-8?B?Y0JXSEtUcVYrbGFKL0NLd1BRWnNPZE9xbFhyRlMzcGZtWWg2VmpKUWlYdWU1?=
 =?utf-8?B?Zk04eUQrQmg4aW5ndWMxVmJiMUcxY2c3QzJ1cGNra2xYS29SWlRlRTZNZy9H?=
 =?utf-8?B?bzFFdDhwdUdOaHVtampyNGZPM2pnUExvaHluYmErWjRxU2VmZ1diRHBlbW5K?=
 =?utf-8?B?UkJjd2lBOEdybVhEV3J2NkF2OXMxTWsvbjBlM2VQZUxXTzM0Ym5sQUM4Uldk?=
 =?utf-8?B?aERURGMzOUpHaHEwUTdhWGVlN2tTdmNVRDM5c0xiZDVJZG1POGExWTNaV1Jp?=
 =?utf-8?B?bXZCb3M5M2I2c1haZS9nNnd1ZjRuNTdlZTdhVXZDcFQvM2NjYVBHTXVuYWxP?=
 =?utf-8?B?WVAvKzVDc3J2M1lqSnBpcEdlQkVrUDU0N1pqckYyRCtMRGMybUd6TUNOMW4w?=
 =?utf-8?B?ZGRFSTdYV3U1My81VkhHdzYySzJmclFiL0NZUGFaMiszRDBqUzJmd1c3QmlK?=
 =?utf-8?B?U3lUMDA4eGtjM3pZK3FKMEhLZEpaMXl4dFVOUmpiTVhjT1VneVljaVpqMUlG?=
 =?utf-8?B?dDJiMWZ4c1dINnRWNDV2enA4aWFXUXMyYXpMM1hSdTZJdW5USmlJVGpDbVBB?=
 =?utf-8?B?NXlzQ2ZLZnJvajFjaGM2MGFtWFBpdFIrWS9FODhCMmxMMXVCNWxuUGdHMk92?=
 =?utf-8?B?TFVQTTRRZFJDc1p5ZFNxRzBTd0RkS280QzZoMFJ6TzlXZk5jZnQ2WDdMbEpx?=
 =?utf-8?B?ZEVDbmhWZDFDcXpxZDdxM0E4azFRNGdzVXYrdTJWSTNVZFUwQldRWWxScEZq?=
 =?utf-8?Q?XLbiih3EieNcwH16KHgKnaytD9uFVh9SrMw1U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB5178.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013)(38070700015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGFudGh4OHQwcU1tR2txL0RmYmtJeEtZd1N6cE1aM1RpNkZCUjdjTUJ0aHdN?=
 =?utf-8?B?bWduZHVOTHpXNUt3aHJDY245QVF5M0VjK1kySTU1YS9MS3IxcEdKeEZBU3Yr?=
 =?utf-8?B?VkdNZDFiazFkWGVMdEVkclIzZldreHBnYUNWdTByR2Q3OTg1VFEzMUxGeDZl?=
 =?utf-8?B?enY4MHBRVThCYnVhSTlvZTlKV0huM3VaOTgyVjcxbjBScWpSNnpoTHNUWXhn?=
 =?utf-8?B?WTh5azZ6UjVoaFloTzkwYjUvd1lZTEhoT2FvRXVUK3hKMEtzdmoyeHF6ZkE1?=
 =?utf-8?B?NVVRc2tkby93QjR1LzdONE16N0xMTW9aK0F2SGZGZnNNOHZVbTRiQnEvTlM3?=
 =?utf-8?B?bHcxVmdnQ2NDUTR2aFVnRmZRTU1IOTE5S0ZMRmhNcSttNG5LNE9nQUxRNFBo?=
 =?utf-8?B?cXNYdjFpeW5XTVV1Q205Q2NDRloyalFEWkdmMGVNSHJMT25yWFlPYzVUbGRG?=
 =?utf-8?B?TnpBQWlnLzVUNW15ZU1UL2FKbzNuTGRpa1hPRUpwcXZlNk45Q0N1QzRyU0cz?=
 =?utf-8?B?RGI3eWx3V3ZlN09XK2Q4V3hRd1JwdDZvWGFPWmJXckg4c0swNHZYYVcyd1lS?=
 =?utf-8?B?VTFsSjJCYVIzdUI4eTZ4Smg1cGVTTmJtUlliSWtiOVFvTWtCVlRtblBHc29P?=
 =?utf-8?B?TTFBd1VrekZlM1ExbzFoNnJUNVp6bExKcWgxdElVOW5Za3d0N2Zpa0hqRFFO?=
 =?utf-8?B?aFFkWVZqL2U1UWJxb1hQMldPcEkxeC9Wb0tyVG1HdVFObzBxWTY3RkFDTHJq?=
 =?utf-8?B?aHp2a2k1TFhmYkx6ZkhiaVBvN2pOMFRqM2NROGpjcFdoQU5nMkE0bWlCdGdL?=
 =?utf-8?B?azA5S0xURkY3Nmc5WDdWR0ZiVzVBajBFTHJ2RGkrZlpESVNMdURNYmtyNHZ4?=
 =?utf-8?B?NDlnTUN0TVp6dzVnM3NjZDRWSFJWQkNBTDJGdThxN01VNm1FbW9IV3NBbW5r?=
 =?utf-8?B?dTA2Y3Z1WlhvdGlNM2UrMUduYjlpWSt2dStvOHVHRk5LWjZUT0twV0QrbGVj?=
 =?utf-8?B?UHUzaFFGSUJrYXZxbjZwV2FucVJmMDlNNlZ1dWt6bkp2UGVzcFhFZ1liOEhm?=
 =?utf-8?B?bXhKQlJrU0RyYnJSWW1LY0tlc1J0bHF3cVczQU9ucG5NRk9YSUZBbWtwTUY2?=
 =?utf-8?B?aDNhbEN5Z3BNMXlBcDkwRklNNjVEMk1TaUJ2clJQcjNQOXo2Y1VzeFd5S0FS?=
 =?utf-8?B?Uy94OFJFT0dyVXhjVlBXMEI5bDRlUmlNMTU2cTN3T0JXY2ExQzlGbEM4aHR3?=
 =?utf-8?B?U005K0wrZHhpWlFoVnVIcFpyck55VFNhYjM2UVB2UHgyYjllQzQ2cWZSckV5?=
 =?utf-8?B?cE43R0thV0FZUGlYL21jTEtYakYydWZOWTBVU0w1TFlQckpsQ2NjWitRbTRh?=
 =?utf-8?B?NzBVQXBpSUZQQk81Z01yQUt4T3RicmhPM21qNWVXd2N6TE5pYVA0U25jcWth?=
 =?utf-8?B?VUJqcGxjOGJFbEx4M3lqWGs2RkxQODlMUUU1VmtZQWJoODU2T2Vvc0IydjNh?=
 =?utf-8?B?akNJaFVvMnhFdlNUMnVoYVRERTZPaFNsWW1vWFVHcGdUdWYxOWtSVGJJZHRE?=
 =?utf-8?B?U3BtMUgwRjl3MzBBbHdBT2lycHV6dGNFWEFkU1dHSE1SWkJuR2NNUlR2Nnh3?=
 =?utf-8?B?cnp4MHVwLy9pOGFzNzBNREpKOWJGdjlpYXZ4ckttM2UrUSt4Zk00dmliczhx?=
 =?utf-8?B?TVVrKzRMUFZITys1b0NpaGdnWlE1SUFIL0o5bkUvSUNCczZCTE15RDJRRFpM?=
 =?utf-8?B?K3VyWXdJOE83dmZFNUVicHpxb09SL3kwY1lsZ1ozN25iU2dKK3lvUW9YUU9x?=
 =?utf-8?B?RTJHSWVUNTZTY3RLbkxEUFZwNTNhbTUvZ0NUSUhxeERmVE9YekNMZ2Jpb2o4?=
 =?utf-8?B?aUZxYXpyYk0zd3pyVWhVam5YQ1NsTTViQXhRbFdMekJCVERSellqTEJpWlBK?=
 =?utf-8?B?czhZTVpsWG5JRTFEVjB5V3NPbzJ6a1pkMzN5QldqL01SbTB3MCtud1pVdk5z?=
 =?utf-8?B?b0t4S1htaXhIL25hY3c4NHBLMnpFYzU4bytneUV3N0hQTlFOZ0liN0djS3pF?=
 =?utf-8?B?bTNKNmtCOFJrbFp4R20yTXBZN3FzcERKWEpXSzRnVnpaWTUzWUd1WlowQU9h?=
 =?utf-8?Q?jzLPM8PSnf6xQzN0CM2c3ISVi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5178.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d318d55d-6f38-41e0-a8f4-08dc8ef40872
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 17:36:34.4070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r3vGSgY7rWp7mBpNgGAfX6dgqKLqCWSxy8tPgdlz+LgJ5CQ2TTnvNGJ3Ez1TO1jlVNicrBpVVhawW3NbIQu/2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR04MB8875
X-Proofpoint-GUID: JcfdUNhQarjRKqQguMF8pgXP-Azde8pk
X-Authority-Analysis: v=2.4 cv=Cdda56rl c=1 sm=1 tr=0 ts=66707429 cx=c_pps
 a=NZTPE88KBhpz0z3fOSYQ1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T1WGqf2p2xoA:10 a=FS7-D2N0u7gA:10 a=FaAtJhzDqMpgERu3f1QA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: JcfdUNhQarjRKqQguMF8pgXP-Azde8pk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170136
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

Pj4gPj4gPj4gVGhlcmUgaXMgYSBkaXNjdXNzaW9uIG9uZ29pbmcgb3ZlciBpbiB0aGUgY29tcG9z
aXRvciB3b3JsZCBhYm91dCB0aGUgaW1wbGljYXRpb24gDQo+PiBIaSwNCj4+DQo+PiBPbiBNb24s
IEp1biAxNywgMjAyNCBhdCAwNToxNjozNlBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
Pj4gPk9uIE1vbiwgSnVuIDE3LCAyMDI0IGF0IDAxOjQxOjU5UE0gKzAwMDAsIEhvb3NpZXIsIE1h
dHQgd3JvdGU6DQo+PiA+PiBIaSwNCj4+ID4+DQo+PiA+PiBUaGVyZSBpcyBhIGRpc2N1c3Npb24g
b25nb2luZyBvdmVyIGluIHRoZSBjb21wb3NpdG9yIHdvcmxkIGFib3V0IHRoZSBpbXBsaWNhdGlv
biBvZiB0aGlzIGNhdXRpb25hcnkgd29yZGluZyBmb3VuZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiBm
b3IgdGhlIERSTV9NT0RFX0NPTk5FQ1RPUl9XUklURUJBQ0sgY29ubmVjdG9yczoNCj4+ID4+DQo+
PiA+PiA+ICAqICAiV1JJVEVCQUNLX09VVF9GRU5DRV9QVFIiOg0KPj4gPj4gPiAgKglVc2Vyc3Bh
Y2UgY2FuIHVzZSB0aGlzIHByb3BlcnR5IHRvIHByb3ZpZGUgYSBwb2ludGVyIGZvciB0aGUga2Vy
bmVsIHRvDQo+PiA+PiA+ICAqCWZpbGwgd2l0aCBhIHN5bmNfZmlsZSBmaWxlIGRlc2NyaXB0b3Is
IHdoaWNoIHdpbGwgc2lnbmFsIG9uY2UgdGhlDQo+PiA+PiA+ICAqCXdyaXRlYmFjayBpcyBmaW5p
c2hlZC4gVGhlIHZhbHVlIHNob3VsZCBiZSB0aGUgYWRkcmVzcyBvZiBhIDMyLWJpdA0KPj4gPj4g
PiAgKglzaWduZWQgaW50ZWdlciwgY2FzdCB0byBhIHU2NC4NCj4+ID4+ID4gICoJVXNlcnNwYWNl
IHNob3VsZCB3YWl0IGZvciB0aGlzIGZlbmNlIHRvIHNpZ25hbCBiZWZvcmUgbWFraW5nIGFub3Ro
ZXINCj4+ID4+ID4gICoJY29tbWl0IGFmZmVjdGluZyBhbnkgb2YgdGhlIHNhbWUgQ1JUQ3MsIFBs
YW5lcyBvciBDb25uZWN0b3JzLg0KPj4gPj4gPiAgKgkqKkZhaWx1cmUgdG8gZG8gc28gd2lsbCBy
ZXN1bHQgaW4gdW5kZWZpbmVkIGJlaGF2aW91ci4qKg0KPj4gPj4gPiAgKglGb3IgdGhpcyByZWFz
b24gaXQgaXMgc3Ryb25nbHkgcmVjb21tZW5kZWQgdGhhdCBhbGwgdXNlcnNwYWNlDQo+PiA+PiA+
ICAqCWFwcGxpY2F0aW9ucyBtYWtpbmcgdXNlIG9mIHdyaXRlYmFjayBjb25uZWN0b3JzICphbHdh
eXMqIHJldHJpZXZlIGFuDQo+PiA+PiA+ICAqCW91dC1mZW5jZSBmb3IgdGhlIGNvbW1pdCBhbmQg
dXNlIGl0IGFwcHJvcHJpYXRlbHkuDQo+PiA+PiA+ICAqCUZyb20gdXNlcnNwYWNlLCB0aGlzIHBy
b3BlcnR5IHdpbGwgYWx3YXlzIHJlYWQgYXMgemVyby4NCj4+ID4+DQo+PiA+PiBUaGUgcXVlc3Rp
b24gaXMgd2hldGhlciBpdCdzIHJlYWxpc3RpYyB0byBob3BlIHRoYXQgYSBEUk0gd3JpdGViYWNr
DQo+PiA+PiBjb25uZWN0b3IgY2FuIHByb2R1Y2UgcmVzdWx0cyBvbiBldmVyeSBmcmFtZSwgYW5k
IGRvIHNvIHdpdGhvdXQgZHJhZ2dpbmcNCj4+ID4+IGRvd24gdGhlIGZyYW1lLXJhdGUgZm9yIHRo
ZSBjb25uZWN0b3IuDQo+PiA+Pg0KPj4gPj4gVGhlIHdvcmRpbmcgaW4gdGhlIGRvY3VtZW50YXRp
b24gYWJvdmUgc3VnZ2VzdHMgdGhhdCBpdCBpcyB2ZXJ5IGxpa2VseQ0KPj4gPj4gdGhlIGZlbmNl
IGZkIHdvbid0IHNpZ25hbCB1c2Vyc3BhY2UgdW50aWwgYWZ0ZXIgdGhlIHZibGFuayBmb2xsb3dp
bmcgdGhlDQo+PiA+PiBzY2Fub3V0IGR1cmluZyB3aGljaCB0aGUgd3JpdGViYWNrIHdhcyBhcHBs
aWVkIChjYWxsIHRoYXQgZnJhbWUgTikuIFRoaXMNCj4+ID4+IHdvdWxkIG1lYW4gdGhhdCB0aGUg
Y29tcG9zaXRvciBkcml2aW5nIHRoZSBjb25uZWN0b3Igd291bGQgdHlwaWNhbGx5IGJlDQo+PiA+
PiB1bmFibGUgdG8gbGVnYWxseSBxdWV1ZSBhIHBhZ2UgZmxpcCBmb3IgZnJhbWUgTisxLg0KPj4g
Pj4NCj4+ID4+IElzIHRoaXMgdGhlIHJpZ2h0IGludGVycHJldGF0aW9uPyBJcyB0aGUgd3JpdGVi
YWNrIGhhcmR3YXJlIHR5cGljYWxseQ0KPj4gPj4gZXZlbiBkZXNpZ25lZCB3aXRoIGEgc3RyZWFt
aW5nIHVzZS1jYXNlIGluIG1pbmQ/IE1heWJlIGl0J3MganVzdA0KPj4gPj4gaW50ZW5kZWQgZm9y
IG9jY2FzaW9uYWwgc3RhdGljIHNjcmVlbnNob3RzLg0KPj4gPg0KPj4gPlNvIHR5cGljYWxseSB3
cml0ZWJhY2sgaGFyZHdhcmUgbmVlZHMgaXRzIHNlcGFyYXRlIGNydGMgKGF0IGxlYXN0IHRoZQ0K
Pj4gPmV4YW1wbGVzIEkga25vdyBvZikgYW5kIGRvZXNuJ3QgbWFrZSBhIGxvdCBvZiBndWFyYW50
ZWVzIHRoYXQgaXQncyBmYXN0DQo+PiA+ZW5vdWdoIGZvciByZWFsIHRpbWUgdXNlLiBTaW5jZSBp
dCdzIGEgc2VwYXJhdGUgY3J0YyBpdCBzaG91bGRuJ3QgaG9sZCB1cA0KPj4gPnRoZSBtYWluIGNv
bXBvc2l0aW9uIGxvb3AsIGFuZCBzbyB0aGlzIHNob3VsZCBiZSBhbGwgZmluZS4NCg0KSG1tLCBJ
IGRvbid0IHRoaW5rIHRoaXMgbWF0Y2hlcyB0aGUgaW1wbGVtZW50YXRpb24uIFdoYXQgSSBzZWUg
LS0gc29tZXRpbWVzIHBlb3BsZSBjYWxsIHRoaXMgImNvbmN1cnJlbnQgd3JpdGViYWNrIiAtLSBp
cyB0aGF0IHRoZSB3cml0ZWJhY2sgY29ubmVjdG9yIGlzIHdpcmVkIGRpcmVjdGx5IHRvIHRoZSBD
UlRDIHRoYXQncyBmZWVkaW5nIHRoZSByZWd1bGFyIGNvbm5lY3RvciB3aG9zZSBwaWN0dXJlIGlz
IGdldHRpbmcgY2FwdHVyZWQuDQoNClNvbWV0aGluZyBsaWtlIChmb3IgZnJhbWUgTik6DQoNCiog
RFAtMQ0KICAqIENSVENfSUQgPSBjcnRjLTANCiogcGxhbmUtMA0KICAqIENSVENfSUQgPSBjcnRj
LTANCiAgKiBGQl9JRCA9IGZiLTANCg0KKiBXcml0ZWJhY2stMQ0KICAqIENSVENfSUQgPSBjcnRj
LTANCiAgKiBXUklURUJBQ0tfRkJfSUQgPSBmYi0xDQogICogV1JJVEVCQUNLX09VVF9GRU5DRV9Q
VFIgPSA8d2hhdGV2ZXI+DQoNCg0KQXJlIHlvdSBzYXlpbmcgdGhhdCB0aGF0IGZvciBmcmFtZSBO
KzEsIHdlIHNob3VsZCBzd2l0Y2ggRFAtMSB0byB1c2UgYSBkaWZmZXJlbnQgQ1JUQyB3aGlsZSB0
aGUgd3JpdGViYWNrIGlzIHN0aWxsIGJ1c3kgYmVpbmcgcmV0aXJlZCBpbnRvIGZiLTEgdGhyb3Vn
aCBjcnRjLTA/DQoNCj4+DQo+PiBPbiBNYWxpLURQIGFuZCBLb21lZGEgYXQgbGVhc3QsIHlvdSBj
YW4gdXNlIHdyaXRlYmFjayBvbiB0aGUgc2FtZSBDUlRDDQo+PiB0aGF0IGlzIGRyaXZpbmcgYSAi
cmVhbCIgZGlzcGxheSwgYW5kIGl0IHNob3VsZCBnZW5lcmFsbHkgd29yay4gSWYgdGhlDQo+PiB3
cml0ZWJhY2sgZG9lc24ndCBrZWVwIHVwIHRoZW4gdGhlIEhXIHdpbGwgc2lnbmFsIGFuIGVycm9y
LCBidXQgaXQgd2FzDQo+PiBkZXNpZ25lZCB0byB3b3JrIGluLXN5bmMgd2l0aCByZWFsIHNjYW5v
dXQsIG9uIHRoZSBzYW1lIHBpcGUuDQo+Pg0KPj4gPg0KPj4gPklmL3doZW4gd2UgaGF2ZSBoYXJk
d2FyZSBhbmQgZHJpdmVyIHN1cHBvcnQgd2hlcmUgeW91IGNhbiB1c2UgdGhlDQo+PiA+d3JpdGVi
YWNrIGNvbm5lY3RvciBhcyBhIHJlYWwtdGltZSBzdHJlYW1vdXQga2luZCBvZiB0aGluZywgdGhl
biB3ZSBuZWVkDQo+PiA+dG8gY2hhbmdlIGFsbCB0aGlzLCBiZWNhdXNlIHdpdGggdGhlIGN1cnJl
bnQgaW1wbGVtZW50YXRpb24sIHRoZXJlJ3MNCj4+ID5pbmRlZWQgdGhlIHBvc3NpYmlsaXR5IHRo
YXQgZnVubnkgdGhpbmdzIGNhbiBoYXBwZW4gaWYgeW91IGlnbm9yZSB0aGUNCj4+ID5ub3RpY2Ug
KGZ1bm55IGFzIGluIGRhdGEgY29ycnVwdGlvbiwgbm90IGZ1bm55IGFzIHRoZSBrZXJuZWwgY3Jh
c2hlcyBvZg0KPj4gPmNvdXJzZSkuDQo+Pg0KPj4gSW5kZWVkLCB0aGUgd29yZGluZyB3YXMgYWRk
ZWQgKGZyb20gd2hhdCBJIHJlbWVtYmVyIGZyb20gc28gbG9uZw0KPj4gYWdvLi4uKSBiZWNhdXNl
IGl0IHNvdW5kZWQgbGlrZSBkaWZmZXJlbnQgSFcgbWFkZSB2ZXJ5IGRpZmZlcmVudA0KPj4gZ3Vh
cmFudGVlcy9ub24tZ3VhcmFudGVlcyBhYm91dCB3aGF0IGRhdGEgd291bGQgYmUgd3JpdHRlbiB3
aGVuLCBzbw0KPj4gcGVyaGFwcyB5b3UnZCBlbmQgdXAgd2l0aCBzb21lIHBpeGVscyBmcm9tIHRo
ZSBuZXh0IGZyYW1lIGluIHlvdXINCj4+IGJ1ZmZlciBvciBzb21ldGhpbmcuDQo+Pg0KPj4gVGFr
aW5nIE1hbGktRFAvS29tZWRhIGFnYWluLCB0aGUgd3JpdGViYWNrIGNvbmZpZ3VyYXRpb24gaXMg
bGF0Y2hlZA0KPj4gYWxvbmcgd2l0aCBldmVyeXRoaW5nIGVsc2UsIGFuZCB3cml0ZWJhY2sgdGhy
b3VnaHB1dCBwZXJtaXR0aW5nLCBpdA0KPj4gc2hvdWxkICJqdXN0IHdvcmsiIGlmIHlvdSBzdWJt
aXQgYSBuZXcgd3JpdGViYWNrIGV2ZXJ5IGZyYW1lLiBJdA0KPj4gZHJhaW5zIG91dCB0aGUgbGFz
dCBvZiB0aGUgZGF0YSBkdXJpbmcgdmJsYW5rLCBiZWZvcmUgc3RhcnRpbmcgb24gdGhlDQo+PiBu
ZXh0IGZyYW1lLiBUaGF0IGRvZXNuJ3QgaGVscCB0aGUgImdlbmVyYWwgY2FzZSIgdGhvdWdoLg0K
DQpBcmUgeW91IHNheWluZyB0aGF0IG9uIGhhcmR3YXJlIHdob3NlIHdyaXRlYmFjayBpbXBsZW1l
bnRhdGlvbiBpcyBhbWVuYWJsZSwgdGhlIGRyaXZlcnMgd2lsbCBnZW5lcmFsbHkgZmlyZSB0aGUg
ZmVuY2UgRkQgaW4gdGltZSBmb3IgdXNlcnNwYWNlIHRvIHBvc3QgYSBuZXh0IGZyYW1lIHRvIHRo
ZSByZWFsIGNvbm5lY3RvcidzIENSVEMgZm9yIHRoZSBpbW1lZGlhdGVseSBmb2xsb3dpbmcgZnJh
bWU/IE9yIGFyZSB5b3UganVzdCBzYXlpbmcgdGhhdCBzb21lIGhhcmR3YXJlIGNvdWxkIHN1cHBv
cnQgaXQsIGJ1dCB0aGF0IHRoZSBEUk0gZnJhbWV3b3JrJ3MgaW5zaXN0ZW5jZSB0aGF0IHVzZXJz
cGFjZSB3YWl0cyB1bnRpbCB0aGUgZmVuY2UgZmlyZXMgbWlnaHQgc3RpbGwgbWFrZSBpdCBhcnRp
ZmljaWFsbHkgdG9vIHNsb3cgdG8gZHJpdmUgdGhlIGhhcmR3YXJlIHRvIGl0cyBmdWxsIGNhcGFj
aXR5Pw0KDQpJIHdhbnQgdG8gYmUgYSBnb29kIGNpdGl6ZW4gYW5kIGRvIHN0dWZmIGJ5IHRoZSBi
b29rIGhlcmUuIDotUA0KDQo+Pg0KPj4gPg0KPj4gPklmIHdlIGFscmVhZHkgaGF2ZSBkZXZpY2Vz
IHdoZXJlIHlvdSBjYW4gdXNlIHdyaXRlYmFjayB0b2dldGhlciB3aXRoIHJlYWwNCj4+ID5vdXRw
dXRzLCB0aGVuIEkgZ3Vlc3MgdGhhdCBjb3VudHMgYXMgYW4gb29wc2llIDotLw0KPj4NCj4+IFdl
bGwgIndvcmtzIGZpbmUiIGZpdHMgaW50byB0aGUgInVuZGVmaW5lZCBiZWhhdmlvdXIiIGJ1Y2tl
dCwganVzdCBhcw0KPj4gd2VsbCBhcyAiY29ycnVwdHMgeW91ciBmYiIgZG9lcyA6LSkNCj4+DQo+
PiAtQnJpYW4NCg0K
