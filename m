Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B72D53D6
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 04:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7676E0F6;
	Sun, 13 Oct 2019 02:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFF56E0F6
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 02:52:54 +0000 (UTC)
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9D2qjCZ021604
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 20:52:45 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9D2qihM021552; Sat, 12 Oct 2019 20:52:44 -0600
Received: from MWHPR03MB3086.namprd03.prod.outlook.com (2603:10b6:a02:a8::19)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BYAPR03CA0006.NAMPRD03.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 18:02:55 +0000
Received: from BYAPR03CA0021.namprd03.prod.outlook.com (2603:10b6:a02:a8::34)
 by
 MWHPR03MB3086.namprd03.prod.outlook.com (2603:10b6:301:3c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 17:32:36 +0000
Received: from BY2NAM01FT031.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e42::202) by BYAPR03CA0021.outlook.office365.com
 (2603:10b6:a02:a8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 17:32:36 +0000
Received: from ipmx7.colorado.edu (128.138.128.233) by
 BY2NAM01FT031.mail.protection.outlook.com (10.152.69.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384)
 id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 17:32:35 +0000
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:50:14 -0600
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:19:02 -0600
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 09:58:16 -0600
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 09:47:26 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 09:39:29 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731423AbfJIPj2 (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 11:39:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:38038 "EHLO mail.kernel.org" 
 rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP        id
 S1729471AbfJIPj2 (ORCPT <rfc822;linux-kernel@vger.kernel.org>);        Wed,
 9 Oct 2019 11:39:28 -0400
Received: from kernel.org (unknown [104.132.0.74]) (using TLSv1.2 with cipher
 ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits)) (No client certificate
 requested) by mail.kernel.org (Postfix) with ESMTPSA id 3DC5D21848; 
 Wed,  9 Oct 2019 15:39:27 +0000 (UTC)
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
IronPort-SDR: AE0cSRQXoUy2z/qZ9GYIAAErLO0rwgfTP0s9yEgKlI6Skd3h749t/hUm3L4vlD503CgO5YHQEp
 UybQQfQcUKhJT0lyNhLifjffk44hpi7j4=
IronPort-SDR: KG+bVdYcylINA5xgYL2o941wfVfSVr8MNMKwhcGVX+mCqsfFKnzo25IuN9+FQdzFF9vkjuRkSz
 IrCAJAgyQ+k8oIXtmoFY1fLjw8wWm+Cgo=
IronPort-SDR: VFAJCJQvSCs75oBIS1xzcuWD5wDiEpm1r0NDf5W4ndF4l/6y68V9vN5X5tTmNijSnHGkSyyP0u
 DU8wrM1g/tt538fyvqkeK3bO3boxS2ixw=
IronPort-SDR: n4VQcfS3ktE/QzqmNRWj+ACHTPJYgsYVh0K4uhd/ZL8kxxfuLJ9fDAfqLRzwgq5VRROLmEmdRd
 uCYi6Av8QqmnrgTbGI2iVlO5ruXHneNzI=
IronPort-SDR: eJhVWo8HZ1Ct08EUUyUfPKDDWP8BFIP+0o6p0xYI5099+acIF350bts3zGZ5+iIuw8+pwN9z8r
 dIs4sfgtM4zgHUSLWCEN4DLKB/1ooeDpI=
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: migi9492@g.colorado.edu
Authentication-Results-Original: mx.colorado.edu;
 dkim=pass (signature verified)
 header.i=@kernel.org
IronPort-PHdr: =?us-ascii?q?9a23=3ArwFQxhRZRf8frAob4ZlYRXBee9psv+ypbCI2y7?=
 =?us-ascii?q?9ipqxHdrmq45XlOhCEuqdz2QaaFYyO8elNzvHWuvq9Bz9I6sObvXQLYJFAEA?=
 =?us-ascii?q?QEjN0Skl9oDJuGBFf9IfqsaDY1T6EgHBcttznzeQBOTcrzaVTPpmHhpSJHQ0?=
 =?us-ascii?q?igbVQue7mrRd237Yz/n6j6s9WbaQUdmxe/YoNfNBLopEbWvfAdoIxyLaAP+C?=
 =?us-ascii?q?LXnHVjcvxW+iBxB2KMjUvO+uKv98swlkYY87ppv4YIGaWvXqJ9d7FACCVjD2?=
 =?us-ascii?q?dn3sDluAPOSwCC/SkySGITwCZPUSPOvirnVJX8uTeomuNh1Xu0J8rzHtVWEX?=
 =?us-ascii?q?zqp+8jAFfi3QMmJx5k6T7Y1JdLoJpfhhn+oEVC+I3tO5Clc6NVI/iMVO0CeX?=
 =?us-ascii?q?pGcvlMWgVxLtm8QYo+C+cgfud7s7u+/hgioTHgYGvkTKungncAzjfz2akEy/?=
 =?us-ascii?q?QnPyea+CkLO8khgUnKqejZaJtDX8m/ne7P5x7GTtdNxG/ezKXQUUAB+NrPfK?=
 =?us-ascii?q?wrWPbQ8HZ+FFjUvBbJ9M+AXXvdnqxF+yDTp85ED7uBlX8+tFhDnzeEl9wwuI?=
 =?us-ascii?q?jVgZw6kw6YrXUgmMUEF9KXax57WuPxQ9NA8iCAMI1uRdk+Bntlozs+1ugesI?=
 =?us-ascii?q?WgL3JQmr062x7SbeCGeIGU4xXlEdycOip8mGk7KOC6l1C59kyn0OTwUY+53E?=
 =?us-ascii?q?sZ5iZGk9yZrnkWzFST8cmITPJh412skSiCzQHd6+xIYAg0mKPXJoRnw+sYlZ?=
 =?us-ascii?q?cJt0nHWCjsl0g=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0GAAgDP+51dh0O0hNFlHAECAQEHARI?=
 =?us-ascii?q?BBAQBgXyCG3BUMSqEI4NKixGCDxSbBRYBAQEBAQEBAQEIGA0HAQIBAQEBg3l?=
 =?us-ascii?q?FglIjOBMCAQIJAQEBAwEBAQIBBQIBAQICEAEBAQoLCQgphTQMg0ZqAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBAQEBAQEWAg1UZAECAwECIB0BATcBBQkBAQoYAgIFEw4CAgM?=
 =?us-ascii?q?MLgoQBhiDHQGBaCIPrz51gTKCfQEBBXaFBIE/AwaBDCiKcYEdGIFAP4QjPoJ?=
 =?us-ascii?q?IGQSBXxWCeTKCJo9vhVuBJZZYgiyHCI4FDBuCOot6iwyWT5E8gWmBezMaCCg?=
 =?us-ascii?q?IgydQEBSFQoUUhV8iMgGBBAEBAZNdAQE?=
X-IPAS-Result: =?us-ascii?q?A0GAAgDP+51dh0O0hNFlHAECAQEHARIBBAQBgXyCG3BUM?=
 =?us-ascii?q?SqEI4NKixGCDxSbBRYBAQEBAQEBAQEIGA0HAQIBAQEBg3lFglIjOBMCAQIJA?=
 =?us-ascii?q?QEBAwEBAQIBBQIBAQICEAEBAQoLCQgphTQMg0ZqAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEWAg1UZAECAwECIB0BATcBBQkBAQoYAgIFEw4CAgMMLgoQBhiDHQGBa?=
 =?us-ascii?q?CIPrz51gTKCfQEBBXaFBIE/AwaBDCiKcYEdGIFAP4QjPoJIGQSBXxWCeTKCJ?=
 =?us-ascii?q?o9vhVuBJZZYgiyHCI4FDBuCOot6iwyWT5E8gWmBezMaCCgIgydQEBSFQoUUh?=
 =?us-ascii?q?V8iMgGBBAEBAZNdAQE?=
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="286799976"
MIME-Version: 1.0
In-Reply-To: <20191009060520.GA14506@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-5-masneyb@onstation.org>
 <20191009022131.604B52070B@mail.kernel.org>
 <20191009060520.GA14506@onstation.org>
From: "Stephen Boyd" <sboyd@kernel.org>
To: "Brian Masney" <masneyb@onstation.org>
Subject: Re: [PATCH RFC v2 4/5] ARM: dts: qcom: msm8974: add HDMI nodes
User-Agent: alot/0.8.1
Date: Wed, 09 Oct 2019 08:39:26 -0700
Message-Id: 20191009153927.3DC5D21848@mail.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 17:32:36.0853 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: a1e07d8f-dee9-478b-d73a-08d74cdeacbe
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.128.233; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:MWHPR03MB3086; H:ipmx7.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: BY2NAM01FT031.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1e07d8f-dee9-478b-d73a-08d74cdeacbe
X-MS-TrafficTypeDiagnostic: MWHPR03MB3086:|MWHPR03MB3086:
X-MS-Exchange-PUrlCount: 4
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 17:32:35.8691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e07d8f-dee9-478b-d73a-08d74cdeacbe
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.128.233];
 Helo=[ipmx7.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3086
X-MS-Exchange-Transport-EndToEndLatency: 00:30:20.4955999
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S3pqwuWFHfh7XMQoscQfB1AS7vwdhoKWdAZEx3YZ6kWmUcBaNWMyls0W9Iyx?=
 =?us-ascii?Q?A6Cwn5iFZmqGlIAX6i+hoyMznN+Sgpw+4DZHHL+ABk9IicBNmYXzDdapYjfB?=
 =?us-ascii?Q?X1PbruVXOo8aYt4C/UtI9siF1p/wFcStML0Gl/4z0FKw1A/FXqsJfneHWOSy?=
 =?us-ascii?Q?z6k4H4UCm6rNGEk5T2jHJyfhwONCDUYcWgYQZdRq+60qGOavn24rRYm6u4Lq?=
 =?us-ascii?Q?bq/zcohHEi+V8sdYrM9Vf9jFMCE64AGHizj4ELhhCUz4gtSyngnjFQmroxKp?=
 =?us-ascii?Q?VbN0li7M0XltW3m+VDKWI4gP3yWiP+VHqX1g+C/33vurwhGw7EbMq8ZuxVv4?=
 =?us-ascii?Q?cefrNa0w76RwsSpw+7D/wy6MCGiGuJj21+jDYCYm9bjDkFq3lt+wewP3/Hgp?=
 =?us-ascii?Q?2u1uJH+Kz6Vl7KjukgHB/2Bmj49i3iM9TLDhRKMSydEnxjZGBIYeL6/Ajcp+?=
 =?us-ascii?Q?5EQRfqazSuTqsZBv9bvxZRyGsQwarQ0QjSad8vZYJMiRjnI1I18CsV1svCk5?=
 =?us-ascii?Q?X/rQBQ5y3qcgWOJRg0tJ6Xj3Huq0xJO6CIEX3qrtXZjeUAzrCVQfn8VV/blb?=
 =?us-ascii?Q?Xs3nwCulQKypoFgSD4J3U7EOqS8/EPNgi/3N5PEtZcBdIuH9/urT4pkrpif8?=
 =?us-ascii?Q?rlnFSbm+TBB1QCYek6HMGwGwTLCDyVZZyjC/E6+l7Fhr9/xLlXvHmVsZqmpe?=
 =?us-ascii?Q?KF+ErTSsClrrXZOgT1Pn0FvXaeWk5uCiioWC87ym011wFlO+Ulg7+xNBxRbZ?=
 =?us-ascii?Q?Xv0Qp1UMNV8uosUUldsQlLYgTjpMlgUniIciI6jQoiljRCX5DL0V2uknbHA4?=
 =?us-ascii?Q?31GrRmqkCjVq1+2WVXllNFqoCuAdje7mhjemeex6oXP4uDdHWRtcQOP3y0sV?=
 =?us-ascii?Q?bvf1hAwxZvLWWLUZ3sNxF2oE2AQ3FnBlqpgJH/U+kY8ffyqQhsnogKeyrkeh?=
 =?us-ascii?Q?boCMh2dAIfxCSAO5kXNwHCsqcHJCwR0jdmIT7SME/cPUMN/6Zo81UjUTSEK7?=
 =?us-ascii?Q?wo47FqkAWCINsAdWxxwlYFjHrtZ2dzZgI9jhp5gPwzlJVHVIbPVPoRjwvzj5?=
 =?us-ascii?Q?QZENiLPBEBbXmKBrf8+t02BTGd3XIuAyCUldpK9StbjyC72x7V3mefewu6Wn?=
 =?us-ascii?Q?nAF8uw5YhEEYC+UD35BrGG3jDN8dT01+CIrXbQ8XP+34nKUG47a/P5pIHSBb?=
 =?us-ascii?Q?s+UxoGPuWQF2oWihoa4/VizQ939GP+hVDLkFdA=3D=3D?=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; 
 t=1570635567;        bh=wEjkXEpo6a+ocQcIoxonVZQvVfCaphW+qJXwz5ZtMwc=;       
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;       
 b=LIxH5q7g63SDPlNc7o1USkQ3yX/1C539AVpTxoDWueAXD2hFiYleI+iKtZ+1+DdB6        
 mllVpxnFN4LMCLsGYUvmUD4T9fAb9/oBCmILsu0KLEpK8H1C+Iv3ATiQW9k3yZ+15+        
 LL21Fvyqw1ZUgC9stZitovG1640810+YZgGK8hSU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 128.138.128.233) smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=fail (body hash did not verify)
 header.d=kernel.org;o365.colorado.edu; dmarc=fail action=none
 header.from=kernel.org;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "jonathan@marek.ca" <jonathan@marek.ca>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmlhbiBNYXNuZXkgKDIwMTktMTAtMDggMjM6MDU6MjApCj4gT24gVHVlLCBPY3Qg
MDgsIDIwMTkgYXQgMDc6MjE6MzBQTSAtMDcwMCwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+ID4gUXVv
dGluZyBCcmlhbiBNYXNuZXkgKDIwMTktMTAtMDYgMTg6NDU6MDgpCj4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3Fjb20tbXNtODk3NC5kdHNpCj4gPiA+IGluZGV4IDdmYzIzZTQyMmNjNS4uYWYwMmVhY2UxNGUy
IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaQo+
ID4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaQo+ID4gPiBAQCAt
MTMzNSw2ICsxMzQyLDc3IEBACj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y2xvY2tzID0gPCZtbWNjIE1EU1NfQUhCX0NMSz47Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiaWZhY2UiOwo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICB9Owo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGhkbWk6IGhk
bWktdHhAZmQ5MjIxMDAgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInFjb20saGRtaS10eC04OTc0IjsKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHhmZDkyMjEwMCAweDM1Yz4sCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDB4ZmM0YjgwMDAgMHg2MGYwPjsK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWctbmFtZXMgPSAiY29yZV9w
aHlzaWNhbCIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgInFmcHJvbV9waHlzaWNhbCI7Cj4gPiAKPiA+IElzIHRoaXMgdGhlIHFmcHJvbSAidW5jb3Jy
ZWN0ZWQiIHBoeXNpY2FsIGFkZHJlc3M/IElmIHNvLCB3aHkgY2FuJ3QgdGhpcwo+ID4gbm9kZSB1
c2UgYW4gbnZtZW0gdG8gcmVhZCB3aGF0ZXZlciBpdCBuZWVkcyBvdXQgb2YgdGhlIHFmcHJvbT8K
PiAKPiBUaGUgTVNNIEhETUkgY29kZSBpcyBjb25maWd1cmVkIHRvIGxvb2sgZm9yIHRoaXMgcmVn
LW5hbWUgaGVyZToKPiAKPiBodHRwczovL3NlY3VyZS13ZWIuY2lzY28uY29tLzFlLVB5cTR5X3Fw
Y0dQaEEyaU9taXhGVUVCQjEwTHBuYXpqWHBzZER6aVZyZ1VNTFVCejN0TUdYaC1QTmZYTVpuaXNV
SWQwUUJ4VGhqSUtBRzBfVE16bjRVWWJoWUY0alVEQ200S0F6WGtWM2RBTUxYTEVBV2JyRUVFMEhJ
eXNKVlhObjRPWTZJLVZEOEg2Q0xiM2p6eVFDMm8wN0tVWXVFVEhVclVMSVM1OXVuMXgtV2FZZ0JU
SzlSSkhQUUV2LTF2QnFUakRvb2hUZUhibXlabHBSc2wyVXY0VmtXNmUxVV9Qb2hvU2xwWGNmbXZT
UjgyVmhFYnNtbHZlRzl2MmxVeFphSGhoNUlSRExhOGdQNGo3OXIzMUtpNTJIN3pSc1Fhb2N0V1Vk
c3pVT2JnQUtJdzZoQTJicnlFMW9QMkR2RXl3QlNONGpCVzItWXRudUFqeUxSbGpINjNIMS0tOGds
TlhFM2UxRkV1amZuemtZT3diSmt5eVRCVGJvcGVlTGREUEJCbDRfUHI0ZHVrRDVyZUJHclZLMVZK
aVpPTTBITzJTdEFSc1hsQUE2YkQwcXlpV0VJVjJsaWpkVURxU1FMT0NRbFJyQUJxSmpvQ21Wdmp1
UXg5Zy9odHRwcyUzQSUyRiUyRmVsaXhpci5ib290bGluLmNvbSUyRmxpbnV4JTJGbGF0ZXN0JTJG
c291cmNlJTJGZHJpdmVycyUyRmdwdSUyRmRybSUyRm1zbSUyRmhkbWklMkZoZG1pLmMjTDU4Mgo+
IAo+IFRoZXJlIGlzIGEgcWNvbSxxZnByb20gY29uZmlndXJlZCBmb3IgdGhpcyBib2FyZCBpbiBE
VFMsIGhvd2V2ZXIgaXRzIGF0Cj4gYSBkaWZmZXJlbnQgYWRkcmVzcyByYW5nZSwgc28gbWF5YmUg
dGhlcmUgYXJlIG11bHRpcGxlIHFmcHJvbXM/Cj4gCj4gaHR0cHM6Ly9zZWN1cmUtd2ViLmNpc2Nv
LmNvbS8xc2RPZFdkbEZadHpXWEhfYVVCZW1JaVFfN1h4RF9SV041aTB4X0JDdklTWGFlXzFPWE9D
NktUU25WcGtuS054V3pJc1ItZ005eFZ6b0lNRXBsMl9xQXg1cW9TNjA2aVFtbkxTSWF3UWRJS2pp
dHFESC1TOUt0SGZEaDdFcUZ1VEJaNEJIbXFuNDFqekluRlpseUVSTzZIOVBFVFJPWHdBcllHd1hk
RGtqNUZFVTRqSHN0SjlNZ3pQWDREaDdBZXpmUkp0b3JaaGJTU1NPN05adjZKUlpZcnJsRkt1RnpG
cWxfc1ZuQmtrLXlBd3B1TWxqU1duUXBNUHp0a2RaU0hLVk9pZmJWZEVHdHhsRTNNclljZEM1ckRl
ZkVGc0RJbXE2OTR4TkxQSHdUaDB6TkJHVXAwV0RtbUpGZlc5eDVoM3lGdjhVLVZGSElrRk54dzFJ
WUhjZEwzX3ZOM1lGQ3dOZmw3MEQtZ2JHYkxxYUhueGtlWWNULXY0Um1HdmxBRkJGSmdoam9SLVp2
SmtyeTBTZEVVNHBUdHJnbFlCOEFCUVRPOHBXa1RaeGJQRkdGMmF2cm9RVF9SSkdPLUJPOVpMTlB3
MmszVUZCZUpNaVgtekNIQ051OHcvaHR0cHMlM0ElMkYlMkZlbGl4aXIuYm9vdGxpbi5jb20lMkZs
aW51eCUyRmxhdGVzdCUyRnNvdXJjZSUyRmFyY2glMkZhcm0lMkZib290JTJGZHRzJTJGcWNvbS1t
c204OTc0LmR0c2kjTDQyNAo+IAo+IG1zbTg5OTYuZHRzaSBoYXMgdGhlIHNhbWUgc3R5bGUgb2Yg
Y29uZmlndXJhdGlvbjoKPiAKPiBodHRwczovL3NlY3VyZS13ZWIuY2lzY28uY29tLzFySmEtMEVQ
eTBKbFAtNzdrOWRzQi1ESDJaQ3ExNFNpOWxrbk1OZ3NqUTFtVTlBd01SbC1mal84RHR3V2ZEQXZu
dE1jb0Z3YkNIUFFKTnV3cENfS01ITGNkbTRGWjBSblJVdGZ6ODhwR1hFaldUV2llblhqOUZsOVRN
MEtvVjRIa1gwUkEyc0xGNzZqM0tleUJJd1puRzZWSExJUHJMVHBmQWRoRlNOWjhNbXpkZ1pNeXBi
VlNPM0lFUHBBN3pOUDNxRVFneXFFMjd0dUFoSDh5NlFuZXhWa0ZQQ2pNY2ZIWGktdnJiSE5rc291
eDBYUjY5TWlmSjRXbU5VQWtGdG9tQ3hfbEpyeF9vcDQzamhGek9vY0JpOF9lbkZVUVlrXzh3MXFk
R1J4M0dNYXNmZjl3TnNrSS00Mzd4bFBEbUVraWtIaXdHQjhwT3Z2bkU5RThtV0pfc2dReEVWaWt5
dUx3R0RENktCSU5sLVRpdDZOTmprSERrUzRZUVAtRmRaakFvT1N6UlhQN2dPRmVJaGdDQWRia2E0
Vk1fVkNhcVhoemNnV2ZDeXBNTWgzM3I5dHlLN1NUczNQdzBJSUNHWnVZUGJndDBQMk5ybmQxUl9f
T0FtT2hQUS9odHRwcyUzQSUyRiUyRmVsaXhpci5ib290bGluLmNvbSUyRmxpbnV4JTJGbGF0ZXN0
JTJGc291cmNlJTJGYXJjaCUyRmFybTY0JTJGYm9vdCUyRmR0cyUyRnFjb20lMkZtc204OTk2LmR0
c2kjTDk1Ngo+IGh0dHBzOi8vc2VjdXJlLXdlYi5jaXNjby5jb20vMXJKYS0wRVB5MEpsUC03N2s5
ZHNCLURIMlpDcTE0U2k5bGtuTU5nc2pRMW1VOUF3TVJsLWZqXzhEdHdXZkRBdm50TWNvRndiQ0hQ
UUpOdXdwQ19LTUhMY2RtNEZaMFJuUlV0Zno4OHBHWEVqV1RXaWVuWGo5Rmw5VE0wS29WNEhrWDBS
QTJzTEY3NmozS2V5Qkl3Wm5HNlZITElQckxUcGZBZGhGU05aOE1temRnWk15cGJWU08zSUVQcEE3
ek5QM3FFUWd5cUUyN3R1QWhIOHk2UW5leFZrRlBDak1jZkhYaS12cmJITmtzb3V4MFhSNjlNaWZK
NFdtTlVBa0Z0b21DeF9sSnJ4X29wNDNqaEZ6T29jQmk4X2VuRlVRWWtfOHcxcWRHUngzR01hc2Zm
OXdOc2tJLTQzN3hsUERtRWtpa0hpd0dCOHBPdnZuRTlFOG1XSl9zZ1F4RVZpa3l1THdHREQ2S0JJ
TmwtVGl0Nk5OamtIRGtTNFlRUC1GZFpqQW9PU3pSWFA3Z09GZUloZ0NBZGJrYTRWTV9WQ2FxWGh6
Y2dXZkN5cE1NaDMzcjl0eUs3U1RzM1B3MElJQ0dadVlQYmd0MFAyTnJuZDFSX19PQW1PaFBRL2h0
dHBzJTNBJTJGJTJGZWxpeGlyLmJvb3RsaW4uY29tJTJGbGludXglMkZsYXRlc3QlMkZzb3VyY2Ul
MkZhcmNoJTJGYXJtNjQlMkZib290JTJGZHRzJTJGcWNvbSUyRm1zbTg5OTYuZHRzaSNMMTczNgo+
IAoKVGhlcmUncyBvbmx5IG9uZSBxZnByb20gYW5kIHRoZXJlJ3MgdGhlIGFkZHJlc3Mgc3BhY2Ug
dGhhdCdzCiJ1bmNvcnJlY3RlZCIgd2hpY2ggaXMgbm90IHN1cHBvc2VkIHRvIGJlIHVzZWQgYW5k
IHRoZXJlJ3MgdGhlIHNwYWNlCnRoYXQgaXMgImNvcnJlY3RlZCIgYW5kIGlzIHN1cHBvc2VkIHRv
IGJlIHVzZWQuIEl0IGxvb2tzIGxpa2UgdGhpcyBpcwpwb2tpbmcgdGhlIHVuY29ycmVjdGVkIHNw
YWNlIGFuZCBpdCBzaG91bGQgcHJvYmFibHkgc3RvcCBkb2luZyB0aGF0IGFuZAp1c2UgdGhlIG52
bWVtIHByb3ZpZGVyIGluc3RlYWQuIE1heWJlIHNvbWVvbmUgd2l0aCBkb2NzIGZvciB0aGlzIGNo
aXAKYW5kIDg5OTYgY2FuIGhlbHAgY29uZmlybSB0aGlzLgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
