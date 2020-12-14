Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8570A2DA8F4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A23189C03;
	Tue, 15 Dec 2020 08:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80129.outbound.protection.outlook.com [40.107.8.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC7B6E20B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:17:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRiaPvXfal12IipH556lKWrTW0qDFp/HdUznbtMsUfvQo60eAiaoqlX2Oou+g/eH2dR20Pt7DaAtF6jx7hSszVb9vRTZ8YNP0BliGpXKoZrkoCRu5oG5DpV6RMioQDRw6+7Wck2oelUgeaTTRJm7ACBaG1qKffF331SiB0RByrbIGHS5sE54EfRj2vDB+ugms56fyOYtRjt/XO+zm1zIM8yVh+IizQKJ2RIFV7FUHW97afdbnQ3CsjHNFwB0aRiTJuS/zXiVLsYsqQhRWQLrXi2NAgN7qDgQLyStFWgiKS4tF7gkxrVWUybnLCkPBd1oRqxpEU7V2qsMb21n1h0FYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iknzuEnb3giGIHoXyhZ9kEGb+y0tJZ3bl6jlndVifhE=;
 b=DmFihtljJLRJIIPwry8tlAB7BCZWmL/VSUsDuk3WpNAOLj2HHhiRgJS6bdX60V3Or9oJIoAFykQ0k+QldbQq1iiquwQ/zV4OyuB+CCzq6A9KkkuyYOAVTtzd78Hewd7trh0jY6jW2yDavgzqdUK9wTMt+qlJ2MORVu6DwzK/zIzCoXjt8oa/ydGtGeppQM/hG0LqqAsqEGUyB/Sh8+71OtqrvhE51wWpLmZaueWCRFOeqz9BDg6kD+ddfpUQL80lnJX9Jy4mymlxSSvwvjGDz7w6lnWuOGe2E/vBBM2P3kpWW832VOu1JiUw8wJLkThDZ873SExb55qGH1jECiloWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iknzuEnb3giGIHoXyhZ9kEGb+y0tJZ3bl6jlndVifhE=;
 b=AadqqKtKfV0uXXsAqM9kMOWVS/FTvA/huK1KxA2Y2e/ddEaPFzDdi0qq+PyvwW8GZ8JwGZsprQ113ua6ANi4CKtlN6NiYhVXXU3u2etUE9SKCrw7/QAuifvNxHw5dmyt+6zcxGGNxUd4es0t8JVQzufITxTR7gIJTHn7o+Lm+dU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Mon, 14 Dec
 2020 14:17:14 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d5:953d:42a3:f862]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d5:953d:42a3:f862%7]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 14:17:14 +0000
Subject: Re: Using Etnaviv with mxsfb-drm
To: Lucas Stach <l.stach@pengutronix.de>, "marex@denx.de" <marex@denx.de>
References: <339ba605-f0af-32d7-9678-877fd6b1fc58@kontron.de>
 <e66672b54d8940995b79bd07ac35d7f4f83b66ea.camel@pengutronix.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <251edc9d-6ff9-ed4e-a314-28bab755fd3e@kontron.de>
Date: Mon, 14 Dec 2020 15:17:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e66672b54d8940995b79bd07ac35d7f4f83b66ea.camel@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [88.130.78.28]
X-ClientProxiedBy: AM0PR06CA0115.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::20) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.17] (88.130.78.28) by
 AM0PR06CA0115.eurprd06.prod.outlook.com (2603:10a6:208:ab::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 14:17:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f931d4-0989-4d51-3076-08d8a03af4d9
X-MS-TrafficTypeDiagnostic: AM0PR10MB2963:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2963B5B99E6FFCBBA0D989ABE9C70@AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nzbWmsRG60+jJbUb6fvtEU6kfmk0qKNPu3PXrVx7LCKR1nElHm/LDNkOKTk42fCQSSAyfMFY9fPiSmqWfu3E6oZNWKZS/wJqya63U1fb7SlfWvqdvQDozjwWHWaQx0Cb96oxZH+tgztS9VRwMQxqPm5BSP7GAWpRIoH8eRn1GNuY1ubW1LtHO6v8mHOsR+l/Skx+3t9GZPeaSoqkMBsyxSFCCoeYC2rfC+wfS2gWAMgsOR0VCES1xiLELfRDsLASQNocacT/kWfp4OYtLf7eJEq6vJI/aeabRfHpWCAAHGhoHSK1EYxJlBwFYaYcLroWfw3boCG+he+J93e4W8oD8uNEeRBtiupQKoyKqV/FSunM/iDjbrliD5vZFU74qEHErmY8vrYDMWipGIEnWWv49bQMtsk33p85QGaNyaraBQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(110136005)(5660300002)(186003)(31696002)(4326008)(16576012)(2906002)(8936002)(86362001)(8676002)(2616005)(44832011)(956004)(66946007)(316002)(66476007)(66556008)(16526019)(53546011)(26005)(6486002)(31686004)(52116002)(36756003)(478600001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QXROOVJOdDZZQjBZUUJ1cXZSbkFwZ1UyY3F1WkNRY1hSdHVybmZKZHNweVRP?=
 =?utf-8?B?Y2N5WjNIVE4xUlpCRGFxTUFFYjNtRTU2elhBM1laWXRoVW1Uck9LeklYTjZq?=
 =?utf-8?B?OWdIMkVwQnZ1RXNXL2w2VFZqdjhPN3lVdUE5NEc3NU5XRWFvekJtWDRzOWVz?=
 =?utf-8?B?NEJCRi9JRzdYVGxmZXlPV0JtTHNvWWNlNlBDaWRPc0pUODErd0NEV2E0U2tR?=
 =?utf-8?B?WitSdEFjTU0wWUtzNHNOUGFUVysxVGw4Q1VsNTJ2L3M3eFBJOGZ4N1kzUEU0?=
 =?utf-8?B?QlRpbjVUTmRiQVMvSGNBV1F1MkVDSUczc2NuSnFVWFlpOGdqRGVWWHVKN0Zi?=
 =?utf-8?B?Ylg3OGJaS011ZGZtVzBoTlJSZ01KT1RIMDVtNURyVjE0V0ZjMVBIazBERzBr?=
 =?utf-8?B?WmhLdHdvYktWKzUxbmU4Q2FTQ3JIdWRIWWQ0Nm5mK0dpdTA4ZmJnbzk3NXM2?=
 =?utf-8?B?YlBieTJ4VUdXSnNsemIzcm1HdjV5WFFXeGRKQ0wzUzJUMFFuemdvbWlSM3VJ?=
 =?utf-8?B?akFvNzV6MTd3aDZBNTlMeFh2WGtjM05kckVXWFd0dE5la2NzbmJ6V1k5cWtO?=
 =?utf-8?B?L1cySm02blgyUHRjR2ZPNm1hdnRKMTAvellZSmZpbVRhakxsaE1RWm1XTDZN?=
 =?utf-8?B?Z0dzUlVxNktnY1RWMDVia1pIRVRsNUtHZ09GbnRFOWs2YmNmdVVEeEVOYXJ5?=
 =?utf-8?B?ZzVKemtlNko3TUo4aTY3aytMT295eHl5VllOQWdxS1czZndRUElKWEhhelRy?=
 =?utf-8?B?QkExSXFicEF3ZGV0K3ZoMElYOEhuYlpOVU1QUWNCMVlXd2NVQ3ZnVkFRUUIw?=
 =?utf-8?B?ZGpNOCtwd0hzdWpZSVZ4L1VwaFJtRE0raEUvR1lhbE83VlhlUnFYUFNGNml2?=
 =?utf-8?B?cjgwZTVJcGlLYUVNU0h1Ukh1YjZ4dGdsc2lzeHozV3g2RDFwRFYzMjhqWmFq?=
 =?utf-8?B?eUV1aGlhYkVtaXB4WDJDdG5oQXBLZUdRanc5V3gxSzJ1cUo1R3VzMzlSdmk3?=
 =?utf-8?B?aVJKdWF6b2grWWZuK1VKaXZVZU1MQm50TW9raDU1WGs1bnVJUzJhT0gzc0Qz?=
 =?utf-8?B?NkpJWFdXYzErcjJSeXMrZXg3ckcwdzNxdnhwanVmeFBBZW1BbUlJNkNXd3NQ?=
 =?utf-8?B?MWRoOGJ2cGxLSExrWVdsY1BmSCt4blZNTzQwc3ZXbGtDOURIMlVsNWZhOEtl?=
 =?utf-8?B?Y0pXa3NjMXlFeTllRStwS3JXdTRLZGhuakJXZDd4Qmp2aUQxMkVaYlJLTGdn?=
 =?utf-8?B?TjJWTFRjVWhTQXpMbHI2Mys3MkNKMko5bW1TK2lUWHJLWHpTZ2FLTy82TVF4?=
 =?utf-8?Q?PEux7hv1VWfyw=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 14:17:14.9117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f931d4-0989-4d51-3076-08d8a03af4d9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgaYUpdH/qyWFTzSj2M9hJg/zGXxCvq1uuf2wF2JRYd9TklR3jS6TZdm1lVJVs/jtEmJPVpZlMJWBAt/wXe/spY5+xjFirpMjc23j5qoLGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2963
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMsCgpPbiAxNC4xMi4yMCAxNDowNiwgTHVjYXMgU3RhY2ggd3JvdGU6Cj4gSGkgRnJp
ZWRlciwKPiAKPiBBbSBNb250YWcsIGRlbiAxNC4xMi4yMDIwLCAxMzozMyArMDEwMCBzY2hyaWVi
IEZyaWVkZXIgU2NocmVtcGY6Cj4+IEhpIEx1Y2FzLCBoaSBNYXJlaywKPj4KPj4gd2hpbGUgZG9p
bmcgc29tZSB0ZXN0cyBvbiBpLk1YOE1NIHdpdGggRXRuYXZpdiBhbmQgbXhzZmItZHJtICh1c2lu
ZyB0aGUKPj4gcGF0Y2hlcyBmb3IgRFNJTSwgR1BDLCBCTEstQ1RMLCBldGMuLCBzZWUgYnJhbmNo
IGF0IFsxXSksIEkgbm90aWNlZCB0aGF0Cj4+IEkgZG9uJ3Qgc2VlbSB0byBiZSBhYmxlIHRvIHJ1
biBnbG1hcmsyOgo+Pgo+PiB+IyBnbG1hcmsyLWVzMi1kcm0KPj4gPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiAgwqDCoMKgwqDCoGdsbWFy
azIgMjAxNy4wNwo+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4+ICDCoMKgwqDCoMKgT3BlbkdMIEluZm9ybWF0aW9uCj4+ICDCoMKgwqDC
oMKgR0xfVkVORE9SOiAgICAgZXRuYXZpdgo+PiAgwqDCoMKgwqDCoEdMX1JFTkRFUkVSOiAgIFZp
dmFudGUgR0M2MDAgcmV2IDQ2NTMKPj4gIMKgwqDCoMKgwqBHTF9WRVJTSU9OOiAgICBPcGVuR0wg
RVMgMi4wIE1lc2EgMjAuMi40Cj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KPj4gW2J1aWxkXSB1c2UtdmJvPWZhbHNlOkVycm9yOiBGYWls
ZWQgdG8gY3JlYXRlIEZCOiAtMjIKPj4gU2VnbWVudGF0aW9uIGZhdWx0Cj4+Cj4+IFJ1bm5pbmcg
YSBRdCBhcHBsaWNhdGlvbiB3aXRoIHRoZSBlZ2xmc19rbXMgYmFja2VuZCBwcm9kdWNlcyBhIHNp
bWlsYXIKPj4gZXJyb3IsIHdoaWxlIHJ1bm5pbmcga21zY3ViZSBvciBhcHBsaWNhdGlvbnMgd2l0
aG91dCBHUFUgcmVuZGVyaW5nIHdvcmtzCj4+IGZpbmUuCj4+Cj4+IFdoYXQgYW0gSSBtaXNzaW5n
PyBXaGVuIEkgdXNlZCBpbXgtZHJtLCBJIGRpZG4ndCBoYXZlIGFueSBzdWNoIGlzc3Vlcy4KPj4g
SG93IGlzIG14c2ZiLWRybSBkaWZmZXJlbnQ/Cj4gCj4gVGhpcyBjb3VsZCBoYXZlIG11bHRpcGxl
IHJvdCBjYXVzZXMuIEZpcnN0LCBwbGVhc2UgbWFrZSBzdXJlIHRoYXQgeW91Cj4gaGF2ZSBzdWZm
aWNpZW50IENNQSBtZW1vcnkuIEFsc28gdGhlIGVMQ0RJRiBoYXJkd2FyZSBoYXMgc29tZQo+IHVu
Zm9ydHVuYXRlIHJlc3RyaWN0aW9ucyBvbiBidWZmZXIgc3RyaWRlLCB3aGljaCBzdXJmYWNlZCBh
IGJ1ZyBpbiB0aGUKPiBldG5hdml2IGJ1ZmZlciBsYXlvdXQgY29kZSBhbHNvIG9uIHNvbWUgdmVy
eSBjb21tb24gZGlzcGxheQo+IHJlc29sdXRpb25zLiBQbGVhc2UgbWFrZSBzdXJlIHlvdSBoYXZl
IFsxXSBhcHBsaWVkIHRvIGdldCByaWQgb2YgdGhpcwo+IGJ1Zy4KCkdyZWF0LCB0aGFua3MgZm9y
IHBvaW50aW5nIHRoYXQgb3V0LiBZb3VyIHBhdGNoIGluZGVlZCBzb2x2ZXMgdGhlIGlzc3VlIApm
b3IgbWUgKGdsbWFyazIgZG9lc24ndCBjcmFzaCBhbnltb3JlKSEKClRoYW5rcyBhIGxvdApGcmll
ZGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
