Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC22DA8F1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3470D89B9A;
	Tue, 15 Dec 2020 08:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2113.outbound.protection.outlook.com [40.107.21.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809CB8949C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 12:33:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCN8K2gl/p+aBz5a+Vx+2ECn2b8koooat499mgyf/3Ms0t8qgYnGIFPz21T88+Y414iAweAt2x3b5mFklR0cLPS34MP+nbGS9hkHtO9w5Ix0vF2wCkESo2h8tGpQu5Yp9aEffSa/zLEgeVULH/0ypcC7w5zdL/TZzZUoydG2d7ec9gadZJTbiq3mE7T4jAx/u0KwE/ht4ROci+Ri2viIN+UJFnG5sroHipzzc4qbe9WSKELwG2D/xSKhVic5GPFXFDUv/jAVsuHecAyt2/4PypLffaseHhXo4ijE3vhzUsJ1zkbSURhpeE+S9DcO+ebxDKvJclOY7nVg8gBIN+u4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrGWFtAHSNWmnts0/NDOVB9hmyvAQZsyNWjcXWsv75o=;
 b=FQiIEg9KHsSpf67XvsOzXDzPVywzKfiE4f7uDeBu5XCaD+aLdKDoQ8rVqbaPxCCUOGoObtScAs7kRjXV6jRjo4c9Qbwm+OzZycwtxo4J79MOm7VbBpPI1x10BrFzZwkxkJRKYE4NneWPyhhINCJBRXEtp9bHPqpedHoER1tVXJOM4B4uH+1Ce+fNoCJ3CyLGbdIiLzpM8Tu/mKIZTr4bV2ftZzFnu1uugeLdd2bTchE0Txu9imdVzSJ8/Ig1SWtHCT/IRA2OymctHp8ASaFtvmoFy3D/hu6H/pt1L65ZlgGqWyWTG4R/V+oEea+195XHAszYYizwMzr8esbyMd4hOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrGWFtAHSNWmnts0/NDOVB9hmyvAQZsyNWjcXWsv75o=;
 b=jyhNA1Ousqoa+iTR4/ZPnmXMp3J1W1w05HkvF6+Ll6NqYhmZro1LmMCoOy5ybZQJh4rIQrrKzbOfyZcYnNDm9xor3v2PwA8skSA7rtLlnRY73aV8kFn//Dp4+LPFPmFL8DPT9IE8nsaAUrDkS1iw1cv7xNxFnrTPvFKJ+4VKjEw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2817.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:125::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Mon, 14 Dec
 2020 12:33:10 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d5:953d:42a3:f862]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d5:953d:42a3:f862%7]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 12:33:10 +0000
To: "marex@denx.de" <marex@denx.de>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Using Etnaviv with mxsfb-drm
Message-ID: <339ba605-f0af-32d7-9678-877fd6b1fc58@kontron.de>
Date: Mon, 14 Dec 2020 13:33:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Language: en-US
X-Originating-IP: [88.130.78.28]
X-ClientProxiedBy: AM8P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::12) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.17] (88.130.78.28) by
 AM8P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 12:33:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55933098-7bf5-4233-c10d-08d8a02c6af1
X-MS-TrafficTypeDiagnostic: AM0PR10MB2817:
X-Microsoft-Antispam-PRVS: <AM0PR10MB281737A7CE3D88907B685CA8E9C70@AM0PR10MB2817.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYycdLmDwPhdd3DaM3jlpVltNYTsiJfIEIpI0QycKfhGcv31IGr3jRoDoUais9dZ7ZxSwkNfE5TgEj7vL+brvae2/CULXPS5qcotO3UWncP/thng3Vo+5OdCAHIK/ZIdvB5nlXWgHqsTxdPmP5LuFQD4pRjVpUlNPUr2oBxF9NF+J8W933yhPAFkDLt2EnEFeMaU8EO7CN6Mg6BvILG/IlZvbF6hCT1DVdLncaULIOlMVhUjXeSASB7J7HQcVWAyvlrs0vi0JgkfEyTsit0Kg8fHKK+irTiaMbjvIleCwlEsuv4CShsARudimny76+QHpwu+5WULw+Qzte2o5vOni1DkLQehedYEc2xUJ6AQ8D/xQiArWdowc/vmINCJBfBBQEMIZfkFzY8RaFFx+joIynHYNr7ZUwnstIazE3PzvU2kVxqHflf9b7KkRW26flnrhtE4ZynnSXUKboj79zUMx7x+nuxrfdEpOwuJIRLKwGRZtBfBprRTIJyYqFwS7vsa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(6486002)(4326008)(44832011)(86362001)(8936002)(66556008)(316002)(31686004)(110136005)(16576012)(4744005)(66946007)(66476007)(52116002)(26005)(83380400001)(956004)(966005)(478600001)(16526019)(2616005)(31696002)(186003)(2906002)(36756003)(5660300002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVRxV2FlSitRTnhSVjNQcnpZUnc0dUE3VmlsN1ZmbFRDTHp6dWE4RFVwakNl?=
 =?utf-8?B?a3FCaW1JNkpCZGFsaVp5azBIMjV6dGxuT2t4eVViSlpGUFdOcVhxeS9qSFY1?=
 =?utf-8?B?b05DUXBlbWRrY1hrbS8zV3B6MEU4WDg5UmVGTzRkUDVpY1YzcnFZWVVIc2g1?=
 =?utf-8?B?U2xsQXFPQkpta1MwL0ZPNEdINDZXcnVDQUJPRzNUTmpDQkUvUnV5Q2VqZWZx?=
 =?utf-8?B?UVB0R0dhWWFpRElESkt2VHdxME9zYzBtMTBQcFlNWWJ4dUlveFoyejk4L1ZU?=
 =?utf-8?B?ekVYTzNabXA5VVI1aExaL3AzQXZpMDZqd3JtZUhOMFpHTlMreU5CRHhwaXR1?=
 =?utf-8?B?RjQ2eHV6WDBHS3Jzd2llVFlqSG1XdnZxK2dHMFZ5bm8rakNUcDFBalhTRTFT?=
 =?utf-8?B?Ny9YNURCbm1PZE1LNjdjTHJYS2FRZ1k0eTV5RXhNZGtYc2ZWa1hncHA3SFVu?=
 =?utf-8?B?NFE4NGROaEZjbEFudklqc1pxaU14Vkp1OWJVaUdRTzRoeWJMR0owVEluN254?=
 =?utf-8?B?OU1FcU1QcGQ4VEo3UjdVYVRwSWFPK0V1SjNXdG1LM2dGb3ZSYWZsTG1QRno1?=
 =?utf-8?B?SlFtVlB1anBnTjNhaDZuUWZWNHVyQjNtNS9XMUkzVUxCY3ZDVmM1L00zWVRr?=
 =?utf-8?B?dXo4eGttdFE0b2Q3ejB2VWluenRFajhFaG9FVGdMbUhIT3dudExwZXl6amdU?=
 =?utf-8?B?Vy96anFNbGY3S05mS1NmZEd0cjdzWEVwRDEyQm1pSTVPNHhCZ2VpV21uMitO?=
 =?utf-8?B?NmdFYTdncld1bCtJeXhDelFOclg2V0RPR3h0N0xGYnRJcUlERS9KQ1NLZXNZ?=
 =?utf-8?B?QzJRaDNlcVpWTGNSMWlKN1ZGekxrVVd5elVVcGFUdFp0bHgxZlpucTVmVE5v?=
 =?utf-8?B?YlNtbWkrOGloYi9nbDBlMVlLNXZ6VGU0V3ZselVHMHd5MFhlcjZMS0dIN2ZP?=
 =?utf-8?B?UFphYU9TOVZ0Tk9jckV6K1Npd1VQK3dlRjVPTmRQazM1NHFhT0t2bERiZ0Zs?=
 =?utf-8?B?TCtlcWtCcUhSSStCSVVDYjE2UFlaNXIyR0ZOdkdiSXUxbHJ6TGR4TWZzazFi?=
 =?utf-8?B?SnlLTHdnVVZtdG5jSmYvc3VrRThyM2lFYTZOc2JCSWFFRThyS2hob0prM0RD?=
 =?utf-8?B?cTh0bnA2RTNxdzVqalNLWS9MR25kWjNBdGMvMEsvNXJNL3ZHU09sdEtobkli?=
 =?utf-8?B?REZ5Wk5SRmpTcVJ4Rk9qUjVZK1hCTHpBU1k0NC94UCt2bmN4M3VDQmN3aXN4?=
 =?utf-8?B?cVE3RG1mQVduS01hd1pPZzArSC9MblIyNmx1bTFuVzZhWTk5cFltaXlVUFFI?=
 =?utf-8?Q?kTMz9eIg7B08s=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 12:33:10.5499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-Network-Message-Id: 55933098-7bf5-4233-c10d-08d8a02c6af1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrZ17JaXzzO5MB4WBa75wwxnbdo7wgUAHZmF7tLuWlgiHVWGMH7DS9ByqVZUenoG9VO/8AEHTFbG8/OXpRFCRqnJIEQQws2mXFzWxBZ+h18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2817
X-Mailman-Approved-At: Tue, 15 Dec 2020 08:06:55 +0000
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas, hi Marek,

while doing some tests on i.MX8MM with Etnaviv and mxsfb-drm (using the 
patches for DSIM, GPC, BLK-CTL, etc., see branch at [1]), I noticed that 
I don't seem to be able to run glmark2:

~# glmark2-es2-drm
=======================================================
     glmark2 2017.07
=======================================================
     OpenGL Information
     GL_VENDOR:     etnaviv
     GL_RENDERER:   Vivante GC600 rev 4653
     GL_VERSION:    OpenGL ES 2.0 Mesa 20.2.4
=======================================================
[build] use-vbo=false:Error: Failed to create FB: -22
Segmentation fault

Running a Qt application with the eglfs_kms backend produces a similar 
error, while running kmscube or applications without GPU rendering works 
fine.

What am I missing? When I used imx-drm, I didn't have any such issues. 
How is mxsfb-drm different?

Thanks in advance
Frieder

[1] https://github.com/fschrempf/linux/tree/v5.10-mx8mm-graphics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
