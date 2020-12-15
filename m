Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0C12DAFD1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 16:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FFC6E3DF;
	Tue, 15 Dec 2020 15:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41FD6E3D8;
 Tue, 15 Dec 2020 15:11:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WU3N4WkBWzx16KgYxb0EZeRljm89C+oOcE+8cYNKTOaom6OIejImxx+HEi7XEk+UyujDc7QIT9ZTjQfhA4eMjibubbI7kQVqtmfsr3vMn4M27lAkvuhLaKKnJygjz0kyxiGBi1sutaAOQs2uk69KAGnV+/fddJ0cS4HS/LfLEbjw2LsFB4rA2NBTHoyW50ptdfBcfIqLv7mxZHqVN5OckGIFSApcMF0pSHnuya7Kmmacq/D7637k2jsQ8YgM/ZZJN6XKYjQKMAVa78vHzKynUFmvviT8VuO7fHIYmE0c2OpmEDYriASj4xTN0QYP2AL+/kB3RuZGVzmxlWK1aPJNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbhKKOw0Vy9hCUCLKaJoRqDU/t3rR5Gyzwh6zO8WJhw=;
 b=l+atYbNhuYIciFxFTgck1UP10saBR9O2+wM4GbRngv33QlL5QXUKntf9hG82UFLZIh51Ll8JFAsVnjEfiLC6hkuL9G0hZHdeT740aN925a1q6HMvl481syisOg5TBIdpASD7WKNl6kj6suh+0O1Ue+QXSRWc98lRli76ZJRAoiP8LKBIqV1y2T/E45mztdohcdknkUblQVfKu/U91PUBdY6YFkgdTybAQkSV6UhcsCRHcjRJ5BJjMV1fD0TmOqj7ilTqg5IrqucgUcLi2eT9cCSHHCeLedrF12JvObNdh1auIPrmuzQz+azuuVWxldse2evzbrH/QAhThVDnyg8Zew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbhKKOw0Vy9hCUCLKaJoRqDU/t3rR5Gyzwh6zO8WJhw=;
 b=QzdlffRrEEGIwpnH1q9tmvva9ScrmcoaDLEQhW+hbt145+GIXKbfN8ipOifkdUq0c0Rw86CKafSMZ5mJE/t0qKsS0JlvzNAB9L9T9kWpSiIJSONOw9Puzs0X4OsM8NG/wZHv1bs1ERdB25VE7LN9asDuFz7Zb7uJ7ezvIINZNNk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4095.namprd12.prod.outlook.com (2603:10b6:208:1d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Tue, 15 Dec
 2020 15:11:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 15:11:49 +0000
Subject: Re: [PATCH] drm/amdgpu: remove h from printk format specifier
To: Tom Rix <trix@redhat.com>, alexander.deucher@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, lee.jones@linaro.org, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com, sonny.jiang@amd.com, xinhui.pan@amd.com,
 colin.king@canonical.com, James.Zhu@amd.com, leo.liu@amd.com,
 thong.thai@amd.com, vegopala@amd.com, boyuan.zhang@amd.com,
 Monk.Liu@amd.com, mh12gx2825@gmail.com
References: <20201215143835.1874487-1-trix@redhat.com>
 <e71eb9ef-d5f9-0829-670f-d5c2c644a493@amd.com>
 <a741836e-7f33-dcbb-d2bd-603091b9a2ad@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6be8d340-248d-3853-8799-4327b76c63ab@amd.com>
Date: Tue, 15 Dec 2020 16:11:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a741836e-7f33-dcbb-d2bd-603091b9a2ad@redhat.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0101CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0051.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 15 Dec 2020 15:11:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 67b8adbb-208c-48b1-b91c-08d8a10bbf3a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4095:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4095DBF8A25AB3D45792259183C60@MN2PR12MB4095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kIToJY5rlSOy76Jdi4yC7+xZTKkQ5VF94Btl7GutWWhFw3Y6g/+J+oNTI0sq8sIogAyGWHVXGuBC6LbFqBcPZb3HQxBpLSP9WnhmffwysZwdp5mFFarlOqsPqCBcaMQtduTLcBX+zpuL3wt2BCm4spt7uq5BoT3YotgwSXrQ8BzZZfCkiLBcPx8nPzdSUdneFTV5Ktx5V7poAlMdkhEuvvXqV2sNed6OPZtEiaXOfKiGSH+IRkIfA29w37EmDtNgmBt+c+UbG1dKWSg0zGbUZvn7zaxZFCTUyICoJ8S2Qg/HS15RYrLj8cSzGbUAAB1u88NGYTdzG8lOmRDtEi26ItoCJ/PSJ/+buZBKrR8v/Uwir3J8x2Lp7nHUE8icb/HWnqqg0/G74s195Rsc+MhU3CeDb1HJHV2Ve6QczpEvmGqP3q+MvIyMOzH4ZP9+0g0Blzwh3R6iINgQ+M+oFZqHXn47uLZ9/Cq5Dckycx3ThYpaG962H8eE6xoaJnlpgFDS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(966005)(8676002)(8936002)(6666004)(6486002)(5660300002)(34490700003)(31696002)(52116002)(86362001)(508600001)(2616005)(186003)(45080400002)(31686004)(66556008)(66476007)(921005)(53546011)(16526019)(2906002)(4326008)(83380400001)(36756003)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3ZXa3hKNG5BNEU2MWZtOU1BeTUvN0ZMZkIyanVvWUl4UXVidWFNRUZzM0F0?=
 =?utf-8?B?MFlmZlJMRU0ySXBadmZLTzVqYUZkdWwwWCszdjFhNVdlTXpXRkZPQjVLalNa?=
 =?utf-8?B?azZUUkJqa05ZYy9LUEgrem1ReUp5NGttcVBpN0JQejZVeE1JemlBb05jaFZR?=
 =?utf-8?B?ZjQ2SnVMQWRaNVhJNzMyUnZEU3NDWHVCblB0V09ka2dseWZRcTNrYWpGT1E3?=
 =?utf-8?B?MUxHbHlkTVB4NnNiWFVPZFhsMy9mb0xFaUdHc1NwcGZsUW1Zdmg4V3hJUTZB?=
 =?utf-8?B?Rm5iYTg0amhMUEtyeHNtN1hScWlyVDFGRkVybEZSb0FUU29oZTZVYVpOVWJO?=
 =?utf-8?B?L1FPNFB0UXJxNmpqaERCWlNxUmhodTdtMGZ5K29VWnpMZVdjcjh2Nk00d1JY?=
 =?utf-8?B?UlpTcXd2S3lYM0twbHJBT0FDRXVSSFp6azFycGthTFRTQ1hlZURFTklpS1dp?=
 =?utf-8?B?LzhzZ3F5VHo1b0VTU1E4WmwwNWxYQU45OG5TWUlKOVhCd0RkQ3FORWJrNHBU?=
 =?utf-8?B?YjlJd25DNjM1REV3NCtWYlZZaW1qenhDY2YxZVkzSkRTMXFuS0IraUV0ejk2?=
 =?utf-8?B?LzhNbGJxZUlPcFUwMFI5am40ZVRPYXZYWGUvL2hPRUFBV2JaY2lFNWc4QnlK?=
 =?utf-8?B?SklDZ3crUkFiLzFCY2JpYVRLRGFwcWluQytXVTdja21iLy83NjNlYmh3YVAr?=
 =?utf-8?B?bWVtRFZkZTMrNSsyaUIyNnR4QjhBNXBRN1J1d0pzVW1MMzlqclpFeHVVdjlr?=
 =?utf-8?B?b09FU1hvaXlQeTRqczlKdXN4S3ROVEQ1SVIzdFNhZ2kxci9QajU0aVZpYXp1?=
 =?utf-8?B?b3lrVlVkOHJBUkdxcnZyVzQrMjliaUFXVUFqT0pMZDJtaDJ6bGkxQlBkeWhi?=
 =?utf-8?B?MzU2V21YUC9KYjl1REorSnJNVWFoc2cwSDFxYkNxWGp4UGxHZ0RUNW5RQTFy?=
 =?utf-8?B?VTk5cUZrUUNDclRNYTRDYnIyamlOTEZ4WUZvRHI5TW5pVlg1VFBMUnN4YUlS?=
 =?utf-8?B?dks0ajRBWDR0MSswdVVqQU1hdGRlelhsOUJ2MlF5cHlZZFZvSEhoRGd4eFpi?=
 =?utf-8?B?MlViMWxhSXRCZWtOTU9yRmRxWi96azJqRm1DSDRsUEY5ZE5zT1M0eWErdzQx?=
 =?utf-8?B?UldkWmoxcWdyQ0dOS1JEZm9MUUZmOEI3OXp0WHFNS3ZQaGhxblJWTTBkWklh?=
 =?utf-8?B?QlQrSjNBelpWSEVTK0hZVEl4b09QRVFsQkpERllaNnVXRnhBVzNSZ3JCQmRG?=
 =?utf-8?B?Z0sreTFpUGJKZ3B2K1REcjVPUGowWXp2UEhpUU51aDY0Y2J4cFBxTjdLa0dS?=
 =?utf-8?B?azFQbWhKRWpuK3lQL0VuekN6OXV5NE1RYnpxNWdvUm9UWVgvcjJIVGlSbWVy?=
 =?utf-8?B?QWJ5YTVvRzExN3J4L2kvQy9BNk9vc3dFZUtWcC9ocnJLYjMxM2hpRnp4QWtJ?=
 =?utf-8?Q?U2qHSwAx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 15:11:49.6315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b8adbb-208c-48b1-b91c-08d8a10bbf3a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhX0/Jx5jWC5a5j93QL4nn0I9unqKhlkyiuElj0lFivj1UOxmHuO+/pqh6e08cNf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMTIuMjAgdW0gMTY6MDYgc2NocmllYiBUb20gUml4Ogo+IE9uIDEyLzE1LzIwIDY6NDcg
QU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDE1LjEyLjIwIHVtIDE1OjM4IHNjaHJp
ZWIgdHJpeEByZWRoYXQuY29tOgo+Pj4gRnJvbTogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPgo+
Pj4KPj4+IFNlZSBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL3ByaW50ay1mb3JtYXRzLnJzdC4KPj4+
IGggc2hvdWxkIG5vIGxvbmdlciBiZSB1c2VkIGluIHRoZSBmb3JtYXQgc3BlY2lmaWVyIGZvciBw
cmludGsuCj4+IEluIGdlbmVyYWwgbG9va3MgdmFsaWQgdG8gbWUsIGJ1dCBteSBxdWVzdGlvbiBp
cyBob3cgZG9lcyB0aGF0IHdvcms/Cj4+Cj4+IEkgbWVhbiB3ZSBzcGVjaWZ5IGggaGVyZSBiZWNh
dXNlIGl0IGlzIGEgc2hvcnQgaW50LiBBcmUgaW50cyBhbHdheXMgMzJiaXQgb24gdGhlIHN0YWNr
Pwo+IFRoZSB0eXBlIG9mIHRoZSBhcmd1bWVudCBpcyBwcm9tb3RlZCB0byBpbnQuwqAgVGhpcyB3
YXMgZGlzY3Vzc2VkIGVhcmxpZXIgaGVyZQo+Cj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJG
bGttbCUyRmE2ODExNGFmYjEzNGI4NjMzOTA1ZjVhMjVhZTdjNGU2Nzk5Y2U4ZjEuY2FtZWwlNDBw
ZXJjaGVzLmNvbSUyRiZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5j
b20lN0MwZGQ2ZmU3YzE3MzA0ZDRlYTcyYTA4ZDhhMTBhZjc2NSU3QzNkZDg5NjFmZTQ4ODRlNjA4
ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MzY0MTU3NzI0MTExMzMlN0NVbmtub3duJTdD
VFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJ
azFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9dGE4TTVpTiUyQmoySjZ0aW8l
MkZNdVVpMmxHJTJCaXlFaGtkc0ZmcFhjRWpHS053RSUzRCZhbXA7cmVzZXJ2ZWQ9MAoKVGhhbmtz
LCBJIGV4cGVjdGVkIHRoaXMgYnV0IGp1c3Qgd2FudGVkIHRvIGRvdWJsZSBjaGVjay4KCkluIHRo
aXMgY2FzZSB0aGlzIHBhdGNoIGFzIHdlbGwgYXMgdGhlIHJhZGVvbiBvbmUgYXJlIFJldmlld2Vk
LWJ5OiAKQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4KClJlZ2Fy
ZHMsCkNocmlzdGlhbi4KCj4KPiBUb20KPgo+PiBUaGFua3MsCj4+IENocmlzdGlhbi4KPj4KPj4+
IFNpZ25lZC1vZmYtYnk6IFRvbSBSaXggPHRyaXhAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pj4gIMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYyB8IDQgKystLQo+Pj4gIMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYyB8IDIgKy0KPj4+ICDCoCBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgfCA0ICsrLS0KPj4+ICDCoCAz
IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jCj4+PiBpbmRleCA3YzViNjBlNTM0
ODIuLjhiOTg5NjcwZWQ2NiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV91dmQuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3V2ZC5jCj4+PiBAQCAtMjQwLDcgKzI0MCw3IEBAIGludCBhbWRncHVfdXZkX3N3X2luaXQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+PiAgwqAgwqDCoMKgwqDCoMKgwqDCoMKgIHZl
cnNpb25fbWFqb3IgPSAobGUzMl90b19jcHUoaGRyLT51Y29kZV92ZXJzaW9uKSA+PiAyNCkgJiAw
eGZmOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB2ZXJzaW9uX21pbm9yID0gKGxlMzJfdG9fY3B1
KGhkci0+dWNvZGVfdmVyc2lvbikgPj4gOCkgJiAweGZmOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIERS
TV9JTkZPKCJGb3VuZCBVVkQgZmlybXdhcmUgVmVyc2lvbjogJWh1LiVodSBGYW1pbHkgSUQ6ICVo
dVxuIiwKPj4+ICvCoMKgwqDCoMKgwqDCoCBEUk1fSU5GTygiRm91bmQgVVZEIGZpcm13YXJlIFZl
cnNpb246ICV1LiV1IEZhbWlseSBJRDogJXVcbiIsCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdmVyc2lvbl9tYWpvciwgdmVyc2lvbl9taW5vciwgZmFtaWx5X2lkKTsKPj4+ICDCoCDC
oMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4+IEBAIC0yNjcsNyArMjY3LDcgQEAgaW50IGFtZGdwdV91
dmRfc3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqAgZGVjX21pbm9yID0gKGxlMzJfdG9fY3B1KGhkci0+dWNvZGVfdmVyc2lvbikgPj4gOCkg
JiAweGZmOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBlbmNfbWlub3IgPSAobGUzMl90b19jcHUo
aGRyLT51Y29kZV92ZXJzaW9uKSA+PiAyNCkgJiAweDNmOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCBlbmNfbWFqb3IgPSAobGUzMl90b19jcHUoaGRyLT51Y29kZV92ZXJzaW9uKSA+PiAzMCkgJiAw
eDM7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgRFJNX0lORk8oIkZvdW5kIFVWRCBmaXJtd2FyZSBFTkM6
ICVodS4laHUgREVDOiAuJWh1IEZhbWlseSBJRDogJWh1XG4iLAo+Pj4gK8KgwqDCoMKgwqDCoMKg
IERSTV9JTkZPKCJGb3VuZCBVVkQgZmlybXdhcmUgRU5DOiAldS4ldSBERUM6IC4ldSBGYW1pbHkg
SUQ6ICV1XG4iLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVuY19tYWpvciwgZW5j
X21pbm9yLCBkZWNfbWlub3IsIGZhbWlseV9pZCk7Cj4+PiAgwqAgwqDCoMKgwqDCoMKgwqDCoMKg
IGFkZXYtPnV2ZC5tYXhfaGFuZGxlcyA9IEFNREdQVV9NQVhfVVZEX0hBTkRMRVM7Cj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jCj4+PiBpbmRleCA0ODYxZjhkZGMxYjUu
LmVhNmE2MmY2N2UzOCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92Y2UuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZjZS5jCj4+PiBAQCAtMTc5LDcgKzE3OSw3IEBAIGludCBhbWRncHVfdmNlX3N3X2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPj4+ICDCoMKgwqDC
oMKgIHZlcnNpb25fbWFqb3IgPSAodWNvZGVfdmVyc2lvbiA+PiAyMCkgJiAweGZmZjsKPj4+ICDC
oMKgwqDCoMKgIHZlcnNpb25fbWlub3IgPSAodWNvZGVfdmVyc2lvbiA+PiA4KSAmIDB4ZmZmOwo+
Pj4gIMKgwqDCoMKgwqAgYmluYXJ5X2lkID0gdWNvZGVfdmVyc2lvbiAmIDB4ZmY7Cj4+PiAtwqDC
oMKgIERSTV9JTkZPKCJGb3VuZCBWQ0UgZmlybXdhcmUgVmVyc2lvbjogJWhoZC4laGhkIEJpbmFy
eSBJRDogJWhoZFxuIiwKPj4+ICvCoMKgwqAgRFJNX0lORk8oIkZvdW5kIFZDRSBmaXJtd2FyZSBW
ZXJzaW9uOiAlZC4lZCBCaW5hcnkgSUQ6ICVkXG4iLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB2
ZXJzaW9uX21ham9yLCB2ZXJzaW9uX21pbm9yLCBiaW5hcnlfaWQpOwo+Pj4gIMKgwqDCoMKgwqAg
YWRldi0+dmNlLmZ3X3ZlcnNpb24gPSAoKHZlcnNpb25fbWFqb3IgPDwgMjQpIHwgKHZlcnNpb25f
bWlub3IgPDwgMTYpIHwKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChi
aW5hcnlfaWQgPDwgOCkpOwo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92Y24uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24u
Ywo+Pj4gaW5kZXggMWU3NTYxODZlM2Y4Li45OWI4MmYzYzI2MTcgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKPj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwo+Pj4gQEAgLTE4MSw3ICsxODEsNyBAQCBp
bnQgYW1kZ3B1X3Zjbl9zd19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoCBlbmNfbWFqb3IgPSBmd19jaGVjazsKPj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqAgZGVjX3ZlciA9IChsZTMyX3RvX2NwdShoZHItPnVjb2RlX3ZlcnNpb24pID4+IDI0KSAm
IDB4ZjsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgdmVwID0gKGxlMzJfdG9fY3B1KGhkci0+dWNv
ZGVfdmVyc2lvbikgPj4gMjgpICYgMHhmOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIERSTV9JTkZPKCJG
b3VuZCBWQ04gZmlybXdhcmUgVmVyc2lvbiBFTkM6ICVodS4laHUgREVDOiAlaHUgVkVQOiAlaHUg
UmV2aXNpb246ICVodVxuIiwKPj4+ICvCoMKgwqDCoMKgwqDCoCBEUk1fSU5GTygiRm91bmQgVkNO
IGZpcm13YXJlIFZlcnNpb24gRU5DOiAldS4ldSBERUM6ICV1IFZFUDogJXUgUmV2aXNpb246ICV1
XG4iLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVuY19tYWpvciwgZW5jX21pbm9y
LCBkZWNfdmVyLCB2ZXAsIGZ3X3Jldik7Cj4+PiAgwqDCoMKgwqDCoCB9IGVsc2Ugewo+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgdmVyc2lvbl9tYWpvciwgdmVyc2lvbl9taW5v
ciwgZmFtaWx5X2lkOwo+Pj4gQEAgLTE4OSw3ICsxODksNyBAQCBpbnQgYW1kZ3B1X3Zjbl9zd19p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBm
YW1pbHlfaWQgPSBsZTMyX3RvX2NwdShoZHItPnVjb2RlX3ZlcnNpb24pICYgMHhmZjsKPj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqAgdmVyc2lvbl9tYWpvciA9IChsZTMyX3RvX2NwdShoZHItPnVjb2Rl
X3ZlcnNpb24pID4+IDI0KSAmIDB4ZmY7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHZlcnNpb25f
bWlub3IgPSAobGUzMl90b19jcHUoaGRyLT51Y29kZV92ZXJzaW9uKSA+PiA4KSAmIDB4ZmY7Cj4+
PiAtwqDCoMKgwqDCoMKgwqAgRFJNX0lORk8oIkZvdW5kIFZDTiBmaXJtd2FyZSBWZXJzaW9uOiAl
aHUuJWh1IEZhbWlseSBJRDogJWh1XG4iLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIERSTV9JTkZPKCJG
b3VuZCBWQ04gZmlybXdhcmUgVmVyc2lvbjogJXUuJXUgRmFtaWx5IElEOiAldVxuIiwKPj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2ZXJzaW9uX21ham9yLCB2ZXJzaW9uX21pbm9yLCBm
YW1pbHlfaWQpOwo+Pj4gIMKgwqDCoMKgwqAgfQo+Pj4gICAgCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
