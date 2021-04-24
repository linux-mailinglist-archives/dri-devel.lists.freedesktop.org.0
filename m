Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A6C36A298
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 20:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064626E2E1;
	Sat, 24 Apr 2021 18:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40096E2E1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 18:28:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnrpDqG2vrpNx4gwTPczfKLlZB+3yO182vSBsP3AgBf/7vb3kcnWJlLU5zD0jTV6iIXSAB2C2HHXEOG/vRsbAmIQHgoxfQ//jGNVNyroTgvw9yURLwx8RseoPlEWDvkhWCLcC/CayWBdOCKB7tffFUuSp12sGC1SRfqmAMN6WbrcflU2oq53ZKyR24/X9UeUt27gr08eJzy5j+2Ft12njS5AV6y7nzXxNZUrAOWVY1nKoVmlAinEs8Y2R8EmKHvdPtFCd2sWe8AHqe/RLzb0m/QGcBxJ2gLtzUkU5nXVrEyfyTkg/EJ0Gl3aXcthNmESIy2vrdAQ750iFZqZQCsVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqrwGrXv+2mwLvlsgWUZW9XCdGsI83mo83oPDG9IRso=;
 b=jAoKqNZPE5g95c7Mn6uYmORJ/q3XtYphCs/ew1CxH6lm1HbRqVJHqFHaw8QZGe87WvqS1IQT9zVHWJDrmUXq/4GUdk19I6kp/y4YBX+1tk3JKJO6rQdFSURDSuALI1fLuI3H7mdj/g/clLDwej7o/e0nEm0ugs9ZzJyFQ0CXtY+hAm5mqTBUho/y+cExU6D9Ejoo+gwyxEsaLXgCVXIOkNNdKgvtjeGRXpeZv5WuJ+xagx4sPzCLd40PkC0bnux1zadRSmqVCBjT4mtTYX3HVIN8dcHjMow9Z3KBpTYbMzMD3Jd1p1lQeIt5KG+4hQnRX+ua4jGDYz5YhGuyHf2vbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqrwGrXv+2mwLvlsgWUZW9XCdGsI83mo83oPDG9IRso=;
 b=u5QT4DssM+eLlivCom1RHiP+nhTTZ0EF16Y3H93wx+yqtjSIOGPf16Z9F3l+MNZxECCy8FBguGM/Hr/GpcSw+1MlTGnjJznmYypePHPCZdNFgLDVN4uoNIueyoaVPy6lT37JrWpNK1mG0c0S20Uf/A48yG9tofnk+xbpe/p9ZfI=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4689.namprd12.prod.outlook.com (2603:10b6:208:8f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Sat, 24 Apr
 2021 18:28:33 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Sat, 24 Apr 2021
 18:28:33 +0000
Subject: Re: [PATCH] drm/amd/amdkfd/kfd_process.c: Fix kernel-doc syntax error
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210424165039.22717-1-fmdefrancesco@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <503524d3-697d-3a76-f09f-830bffc69392@amd.com>
Date: Sat, 24 Apr 2021 14:28:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210424165039.22717-1-fmdefrancesco@gmail.com>
Content-Language: en-US
X-Originating-IP: [142.182.183.69]
X-ClientProxiedBy: YQBPR0101CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::26) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.183.69) by
 YQBPR0101CA0093.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:4::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24 via Frontend
 Transport; Sat, 24 Apr 2021 18:28:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e637f84-ffe0-4fc6-2a49-08d9074ec465
X-MS-TrafficTypeDiagnostic: BL0PR12MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB46895D9370DB6CE190B21F1F92449@BL0PR12MB4689.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YzHHumz3e0yYKaioI4MjQ4yisONbsVMBOOG8ky1VTNkrY9o2LuSvuxltjdTBt6GVbZ7bRE4L6su3w5RIFizg23TVqmF7LtDtZOqnoEd0aOHpAAnoZyA0wtgGa5JUz5ZD01gFP7lcGtb/wwLcCB3yqsQfcbJ1xOG79ZwkNF4myI7PbOr5oS3SN07O69sPRwARGxi2bYxid/4f6hxX7PXIswRuzjZy4XGacTELYBC20HIi42s1wpowgUKT27g2gQ0JfPo4mYuK9sYNQDAYkDeolLjlWc24OXy8E8utAFt9K4GX79Uc5xTYDL/x4/3p8MtpoS4J8vuVCjVuT0MVVDyTcN/fvCZrSOTywNES+GhYX8SnDnSa+FTW4dZaXGKNAemS4VAhCrPT8yrgb8JLx4CqmERpT24WXQX/9Q2gaLAVrKjPWEy6eTtqIg8W4Vucx/YhMqBk9ewPQFM6vV3UrNWPLfuvFpsYGKcV7GmJZpmH8PViZHFnxqUlyN4s9cXeApBxM2y8lFs87FZQ3uYvPM+ioNOE7pNweJ5+DzmvPN0P5PfjHMMbQRf/zf8w6FnCF8edT4do6BXtjcce/3TqA9TXsAT067BX1WYeZNfj4a33rETQinNTA1Npn1F7wMEp4U03ToGqlrqAk6rpMgnIIaquPrMB2AWesNo7ReFI138ef6uOBpIAzZfR17Fm2yEDrZhB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(5660300002)(38100700002)(31696002)(478600001)(31686004)(83380400001)(16526019)(86362001)(66946007)(16576012)(316002)(36756003)(66476007)(66556008)(44832011)(2906002)(186003)(956004)(8936002)(26005)(6486002)(110136005)(8676002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qk41YkdQUlpsSHBSVEhYZDE1TmxPSlA1eURCT0gxeVJSVUM5U2lZc05lMERL?=
 =?utf-8?B?Uy9NRm1ySHFZeUpkK0hnWXRLaGlvRE9WV2dPSmN3d1NrVkg4TlQ1Q2piZzBt?=
 =?utf-8?B?WGJsSnZkRi8vZk1PK2hSeTJWUjQvbUhEdTVVYVVwZURkYWpZSU5QU3R5bG5O?=
 =?utf-8?B?M2Zaak5qMlVFT0hsM3RLYVVxVDFTSExaMDdrelRrNUNpanI5RnlhNTA2Wi9T?=
 =?utf-8?B?WFU2NHZEbFJhLzFzYzgyQ1ZHT0gwbVV4SXB5WVNmY3lRSlFZM20vNHRGR3Mx?=
 =?utf-8?B?QmxROFc3a2dPMFJIcDVuK1RIRExHMzNIclhlTXZjQ0RzbG1HMDFQWWF2Z1lh?=
 =?utf-8?B?bHR6bVQ2VTRLYWM2SXJoUEE5Z09HdjNyNWw2WVQ2WTQ3NDZBbkNmSzliUU8w?=
 =?utf-8?B?YWxSTGdkK1FEZXBnWlVyVVlXZmpERzZ3MmVaa0VocnNVNmxvbFloZ3lRTjIr?=
 =?utf-8?B?enRMNUFCQnk4clE0ZkJaUDQ0UmliODZRbE1rcnROMnR4eVhyK0lmNGVKY0pQ?=
 =?utf-8?B?N1B6U3gzcFErSStrQ2JMTGJTRzFLTVhkbnJ3MWdCRTVMSmJ3dmg1QTZmR2hI?=
 =?utf-8?B?b0xjdDEvZ3QySkxGNE9reTJPRDlGZ1ExMnhGK2Y0eFVyWkY3MmpTQlZ6M2pW?=
 =?utf-8?B?ZzV1TjBRMnJEdDhrdXRKa1RLdVN0Y0VPOGJoL3ZlL290cWpLV0dGYTZDdnJo?=
 =?utf-8?B?bWIvTllsZGd3Um54ZlRUa1FWRDJhcUdPdjY1aDF4MjFaM0thMEJuZDlTV29B?=
 =?utf-8?B?VGpUZUVTRU1QVnpJOGEyeURiVUU0N2kwa0tsQ095RWpocmk3aE5WcThEYXVz?=
 =?utf-8?B?ZVdvS3RMWGFFY3VDRU5nMUprUlRaUVdUTlY3ZkxVRHlhMkZSc0pVcG1aUHlH?=
 =?utf-8?B?OGdyaFdCaUJPaXA0RHNJWUdwRGtaejZjckMyK2t3VElaam50WDNxaGtKeHAz?=
 =?utf-8?B?UkRUeHJ2QVhlN3lmYWhqV2k2enFlRG5UWkQyVU0xMXc0ZG1VUzdQTVdDMDFU?=
 =?utf-8?B?MnhKMzBQZlVRanFldnV5ZEJET3R2UFJ0MnlOQ2tMbUl1L1E2dTZzaU0xVkwy?=
 =?utf-8?B?UEx6c3JsM0VDdWhGMVJPcDRFRDMxVkh3TGJhRi9qcHhZVlJMV05EY1JhSDI5?=
 =?utf-8?B?Y3oyT1NLNFBudVF3c1dYSnlYSjVSVUl5YnlscWtDc0E1OHN2dTJYSDhHS2RO?=
 =?utf-8?B?U2JSQ3NIc1o4REo4QWVZYXlLS1pkRldDKzRtNDVyWGlHVkl0YWJVQ1pOeC9w?=
 =?utf-8?B?UWE1a1VZR2hKeG42SWhCVWtHZkFoM3BabUhlRHFSM0txMlJoc0NwQitQaEZy?=
 =?utf-8?B?bU0yS21QZzdDZ1FqQm9pc2FTejdtMGZ2UXI3amhRWjVJRlBsenRnTzF1NHdK?=
 =?utf-8?B?d2V0eGhScHRCS3RScFJyaHNvMmUwOVI3QWl5NjROUzdsd1JmYm1vb1BMSk1x?=
 =?utf-8?B?VzVrMmlsWktLWDFWRVJWaXRrTGxoMmhQcXZ4RFFRalcyRVNRUTJuUGFXaDh4?=
 =?utf-8?B?cWRtNWJIdGZ2bVdsbmJMd1BOc0diYkhndE1YNEtRbDFGKzZBMUcyQyt6bE5D?=
 =?utf-8?B?cTVoS2hlL1c2THVMRWg0ajRTZ0w0Y1QzdThDNU1lYVQ0WEpiK0ZtemwyTEx6?=
 =?utf-8?B?dXdJS21kS2graElsZGtHUFYrOWtXazdsQnNBZlg5bGRNS0IyNnpkU1VSdEQw?=
 =?utf-8?B?dVI1TVlXa1I5dDFVL1NENVF1dmVtTklWdW9qMytoeGNMWit6Y3ExUHdFSWNw?=
 =?utf-8?Q?CS9obSZK3x0Ry3JLyXGZngFxFazKscd0rWR99kh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e637f84-ffe0-4fc6-2a49-08d9074ec465
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2021 18:28:33.4568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+JWO9a1tT1HM+N0EGlbSaHz6zJ7RWGbIKU4twwYSyJo49DYUTge/Sw+lTr7h/nyTRl0rjI8519onxJDR7DYPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4689
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0yNCB1bSAxMjo1MCBwLm0uIHNjaHJpZWIgRmFiaW8gTS4gRGUgRnJhbmNlc2Nv
Ogo+IEZpeGVkIGEga2VybmVsLWRvYyBlcnJvciBpbiB0aGUgZG9jdW1lbnRhdGlvbiBvZiBhIGZ1
bmN0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmFiaW8gTS4gRGUgRnJhbmNlc2NvIDxmbWRlZnJh
bmNlc2NvQGdtYWlsLmNvbT4KCkkgZml4ZWQgdGhlIGhlYWRsaW5lIHByZWZpeCB0byBtYXRjaCBv
dXIgdXN1YWwgY29udmVudGlvbiAoZHJtL2FtZGtmZDoKLi4uKSBhbmQgYXBwbGllZCB0aGUgcGF0
Y2ggdG8gYW1kLXN0YWdpbmctZHJtLW5leHQuCgpUaGFua3MsCsKgIEZlbGl4CgoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMKPiBpbmRleCA2NTgwM2UxNTNhMjIuLjEyNTg3ZmE3
NjhhOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vz
cy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYwo+IEBA
IC0yNTAsNyArMjUwLDcgQEAgc3RhdGljIHZvaWQga2ZkX3NkbWFfYWN0aXZpdHlfd29ya2VyKHN0
cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgfQo+ICAKPiAgLyoqCj4gLSAqIEBrZmRfZ2V0X2N1
X29jY3VwYW5jeSgpIC0gQ29sbGVjdCBudW1iZXIgb2Ygd2F2ZXMgaW4tZmxpZ2h0IG9uIHRoaXMg
ZGV2aWNlCj4gKyAqIEBrZmRfZ2V0X2N1X29jY3VwYW5jeSAtIENvbGxlY3QgbnVtYmVyIG9mIHdh
dmVzIGluLWZsaWdodCBvbiB0aGlzIGRldmljZQo+ICAgKiBieSBjdXJyZW50IHByb2Nlc3MuIFRy
YW5zbGF0ZXMgYWNxdWlyZWQgd2F2ZSBjb3VudCBpbnRvIG51bWJlciBvZiBjb21wdXRlIHVuaXRz
Cj4gICAqIHRoYXQgYXJlIG9jY3VwaWVkLgo+ICAgKgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
