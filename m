Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1747322135
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 22:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6D06E7D7;
	Mon, 22 Feb 2021 21:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBCB89FC3;
 Mon, 22 Feb 2021 21:18:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiZ8jOM11RU4lAlTJjPr0v2bujCeEVRgmunoBHagXb94fAG898XXAU3br2cToZXwL1VJR4HStXnILw2vT4EUDXopHzSVLN8omIAWOL6AELFRpCzyx0tuaGE4SBw29kcQp7WlpEvkHKRe9aYSFaJuCm4VXjDkkSuhK48Jn9LZ1RRYGY2HmA8okuWxWkIdxtNmEMaF+1wuYB2uqpKUDSMPwZA77XchFYlEdNIqgHmH/Hh7hrZUN/59hi2IpLv9hftcidsE6GFCqNX2+NRyWtedxoq7aW55vvgbj996cjNI4rokM+J/9j5E5Vgp0NU16TJGpPxyWhvRz04jIS5u1Ywtvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq78wik05PDXVxcBUi+SA5/2OhzwHRcgOVle/oAClcc=;
 b=gTndMM3mBjQ34KvF30IPyLKCMiTIwTS6s7fxOO2zffFxUqn0P+wax9TiUemIAmu6gy4XvNMRcezmSgd+PKoRBtwSy5zIS4izd1BpZqfNeXYjrPsSV0iZWMR/pUOWAsnWO/LL3sBXETvucVwab77mEgooUNQab6jwDlKkHErPA7cnnDfPDDX8P4+z7Ax3e58B1WeKlM5otG9XHJJFfdgu2wD9o4CgUFqPTF/mg1dnPn3B4l3yHqdYMjW/b4DLomOYpVLJyNUWY3wWDeua2i7YLk5aDbXFQVVTPihBx2jj71sO+PtXhLvUTsIccxaQfuHLoVJnvngwNMIJfEsMZBxqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq78wik05PDXVxcBUi+SA5/2OhzwHRcgOVle/oAClcc=;
 b=WjM+oZ3ELgxaeLoedr7K5QRVYULqEebXSW2xsAEzDDziLwDzVi98BZtPwDYopWB1IHlYupJJIKL66tsZm5yJYYvFhgpGG+iSo22/RHYy9NRt3g7VTMzxNYtz4EpiaWrkajVV3bBVpIVarfMzZo2EkpyQjs8sYxEoSv5eykrkBlo=
Authentication-Results: foundation.x.org; dkim=none (message not signed)
 header.d=none;foundation.x.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR1201MB2508.namprd12.prod.outlook.com (2603:10b6:300:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Mon, 22 Feb
 2021 21:18:15 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b%4]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 21:18:15 +0000
To: Xorg Members List <members@x.org>,
 "xorg-devel@lists.freedesktop.org" <xorg-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org,
 "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
From: Harry Wentland <harry.wentland@amd.com>
Subject: 2021 X.Org Board of Directors Elections Nomination period is NOW
Message-ID: <8c434d92-2f41-745f-003f-53c299e77c14@amd.com>
Date: Mon, 22 Feb 2021 16:18:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Mon, 22 Feb 2021 21:18:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9cbc996f-ae08-4ff2-1b11-08d8d7775df9
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2508:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2508DD961C6A451C167F5E848C819@MWHPR1201MB2508.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2Ac5C7XE4BhEelkQoThQvu9IwvfjkvjO1zxXgFfaC9I4aI61Z/8O0M8G7sJAdx5U3dMMFnSIWE0NkD+dquCQ1QWiUIEyhGJEp28ixHgM3tCCG1AtlcjvfAmGun+GMasDURgam5nKcbTFFDTAEazAcOSDQvmZdhxbrpSB9wDLl7wjASSdloklNJC7zS3MtUrw5oL/Sz5nS90fAF9VQ/JCqjfBN1rPrEhavWDSu78T3OQWwxgarTjcyDyjsKrCKGHuKHlsDnVye60D7XXJL4FUYb6gFkgOl2DNvJDacj4cWSmbFj/BpyBsQkgXJQEN6LQYWZbusREyNiOCmzKRV2JnSP156yZwexlzBCruHxSPGuNKilqCMFXwhZPTBxjMrSZ7RQSLen6we7EJ0rJHwqHUh7BOif6tmjIZsQAy8Vcp9gE1418I1dvxdcWN/JM4hakYKiO2ab9BO8IvcdicUj5GlqpD3zcoaB5wZSHZmy8aM1DAF4vkEGBczzxvWQ/b/+l1YbYgT96fp3gcoIfUnYyUV1/rvyOBlQzrpB20hgSilUIF00JqkgqmRbmjBeXLw8rIFZfMnyiFFW4JOp18JkrXvSYxbEYeGqc+1K4AauPCacP8A8KCmmi+G0sFUNjRd799p4X/ioaaLpRpn4VYX4eZqMG9/BNdB+X0bTvaoPHJnIq3kzvZ3x7q/tIm0ZAJVYsQKbo5UCdnrGqvtuWylNsOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(8936002)(31686004)(5660300002)(478600001)(6486002)(31696002)(956004)(110136005)(44832011)(921005)(2906002)(966005)(36756003)(66476007)(66946007)(316002)(186003)(16526019)(83380400001)(26005)(52116002)(66556008)(86362001)(8676002)(16576012)(7416002)(66574015)(4326008)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WkNpRjFCWFgrTVZmczREU0NpSExpSUZsdVA5dEMzY2piNTN3Q0krbTVoRmE3?=
 =?utf-8?B?SnJCODlrRGFXUXZHSVE0SlJoMlFhY3phbjd2WVA5RnlSNkJObnNHMDAyaU9w?=
 =?utf-8?B?eHNueEJ0bmJOQ0Fkc3VDV3pLSzB1QURnZzZpVUYreDRWZTVNaVl5YmUxOURZ?=
 =?utf-8?B?R0NPNEhhQmRDVDg3MkFKOHBoRm56bmxTcnJIdjdQV0VzR1k2Qk5mNTZORDhJ?=
 =?utf-8?B?MTVpbzlKQlZSOVN1M25tdGRZRnlSS3VWTll3SGJrdFB0emZsUEhZWUVCb1l2?=
 =?utf-8?B?S3Foc1ZsUUhibnZnQjBxaXZzbnF1bGdVb1lKZStTTVRaaDB3d1JCN1dEendv?=
 =?utf-8?B?VzQvYUtoUXM3cmQxVXZndXZEREZUQnFEQU42WGkvQ3oyU0ZnMFRwTFNCazFV?=
 =?utf-8?B?UTBaZ2NaZDdmSjdySE9FN3hpZy9YdEUzYmkvUW4rZlVYSlFpb1pIeXkrYkEx?=
 =?utf-8?B?OVBCT3BWeDZzampUdWNwZnVxdTFOM1MyWVMyUndmSkNVUmFwWHRUeThEVnJt?=
 =?utf-8?B?SjBmdzRrT3BIWUlBRHRkQ21uT1ZzRjdJUTVlaGM0ZW5NUTlsMVMycmN2ZTlV?=
 =?utf-8?B?ZlNjaVljTGJYYm9CRkRvT0cyOCs2cDRLeVM0a2ViNUNXKy9Vb2dSOW8zVTZN?=
 =?utf-8?B?cXQxZkYwNG5vNHcrVmNLSkR5bkF6a0h3Q0xDZ014anRZWkUvK0Z4VUlDWk9i?=
 =?utf-8?B?SXU3bDNnNnBIdlkwaTJ0dFNvemJvaHhPdk9icjROK3N1QzVLNXc2V0pCU1pP?=
 =?utf-8?B?K213elBEUFV4ZlNpcENDVEkyK0c1ZkVaekFBWWEyUENlNm1GdDJ6Q2MwV0tz?=
 =?utf-8?B?MHdNU25qYm1hUVB3NFp2Zi9sREorYkZvV1NsTlFoK2V2TjA4R3hBMk9hNjJp?=
 =?utf-8?B?MTYrOXkwQ1VHaW1QNGJyYlp6a09nKzRTMzBvcEZkQ3F2VTFUd0JzVWd2OEZ0?=
 =?utf-8?B?T2UvWlZ6RFFaVEpqSVJJbDkrZldYQ3U4WjYzczlYSmJhS3VFbVlCZnU1VEJH?=
 =?utf-8?B?Tzhvem9Pc3NXUjdlbVVqL0twZDNmYkJZSnVPeUZOc1ZxRVpKQVFoajJzSk9n?=
 =?utf-8?B?ZG5DVVQrSW40MkRCcGNsNHp5b0FHTUxUKzJIZWZ0OUFIamlRelNTdjVzMUtT?=
 =?utf-8?B?eHpwb2FSc2hvSDUxN21MQUtpdThyYTlyZ21aeEVCM0JjYXo4cnNoTmxzdnhK?=
 =?utf-8?B?V04xQW1DWnF0Vm5xcmE4dXR0L3FGV3ZPUDE3UTlNcGQ0VmdGUk45VkQzYngy?=
 =?utf-8?B?b2UrSzFFYU9nZk0yYzZ3dlRrUGlMUkFTck91WUpoRm5YZTRGU0Rock1GWVk2?=
 =?utf-8?B?YmRTRUwyQnowNnZrWS9pU3VQSU56L3FibkVmWkdiZ3VTem9JQ3RLczBaS25E?=
 =?utf-8?B?c0lLWStuZ1lJMnNKNmVmckxvQWNrT1Q4alNzRUJJd2loNC8vZWF1VGUvOGJV?=
 =?utf-8?B?ekREazNvVmdXSXZYWVp0MTE5WGgvMFdBNWtkWVN2cjZ6KzNMZVdYbzFTaWtF?=
 =?utf-8?B?aU9FZ2hjMzlod0F5TFl3TFRZWERHdWo5T09QbzRYYi9heDU3ZFIwRXB6dWk3?=
 =?utf-8?B?TVJKdk1OYmNSSjVhMXR5L0NsZnFJRWpKblR5NWJXNnd0eGx6U3UvSFFyMktq?=
 =?utf-8?B?VjIrRHM3VENKbW5zQzVDT2liaVM0ODZCblVzYXJPNVNEaDlnQlhmcTNWcEhY?=
 =?utf-8?B?cWp4QWJQU0dBOHBrdHhaVUVPOVp1aGxoTUFJZU1GRDBEWHkrUmZUdDFaVjFi?=
 =?utf-8?Q?fc0B9qlTSQXGL4mDsJZZL2z9kUX3Gsi2A5YsnwJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbc996f-ae08-4ff2-1b11-08d8d7775df9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 21:18:15.2702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sz3E8FNES8UhOKr+QujIyYTB9g6R01x56ShruVAO7bH6UPRjvf7BBaKPbNlPJGF2Rb4cERXQWvBrcs9Nod74sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2508
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
Cc: elections@x.org, board@foundation.x.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgYXJlIHNlZWtpbmcgbm9taW5hdGlvbnMgZm9yIGNhbmRpZGF0ZXMgZm9yIGVsZWN0aW9uIHRv
IHRoZSBYLk9yZyAKRm91bmRhdGlvbiBCb2FyZCBvZiBEaXJlY3RvcnMuIEFsbCBYLk9yZyBGb3Vu
ZGF0aW9uIG1lbWJlcnMgYXJlIGVsaWdpYmxlIApmb3IgZWxlY3Rpb24gdG8gdGhlIGJvYXJkLgoK
Tm9taW5hdGlvbnMgZm9yIHRoZSAyMDIxIGVsZWN0aW9uIGFyZSBub3cgb3BlbiBhbmQgd2lsbCBy
ZW1haW4gb3BlbiAKdW50aWwgU3VuZGF5LCB0aGUgN3RoIG9mIE1hcmNoLgoKVGhlIEJvYXJkIGNv
bnNpc3RzIG9mIGRpcmVjdG9ycyBlbGVjdGVkIGZyb20gdGhlIG1lbWJlcnNoaXAuIEVhY2ggeWVh
ciwgCmFuIGVsZWN0aW9uIGlzIGhlbGQgdG8gYnJpbmcgdGhlIHRvdGFsIG51bWJlciBvZiBkaXJl
Y3RvcnMgdG8gZWlnaHQuIFRoZSAKZm91ciBtZW1iZXJzIHJlY2VpdmluZyB0aGUgaGlnaGVzdCB2
b3RlIHRvdGFscyB3aWxsIHNlcnZlIGFzIGRpcmVjdG9ycyAKZm9yIHR3byB5ZWFyIHRlcm1zLgoK
VGhlIGRpcmVjdG9ycyB3aG8gcmVjZWl2ZWQgdHdvIHllYXIgdGVybXMgc3RhcnRpbmcgaW4gMjAy
MCB3ZXJlIEVyaWMgCkFuaG9sdCwgTWFyayBGaWxpb24sIEtlaXRoIFBhY2thcmQsIGFuZCBIYXJy
eSBXZW50bGFuZC4gVGhleSB3aWxsIApjb250aW51ZSB0byBzZXJ2ZSB1bnRpbCB0aGVpciB0ZXJt
IGVuZHMgaW4gMjAyMi4gQ3VycmVudCBkaXJlY3RvcnMgd2hvc2UgCnRlcm0gZXhwaXJlcyBpbiAy
MDIxIGFyZSBTYW11ZWwgSWdsZXNpYXMgR29uc8OhbHZleiwgTWFuYXNpIEQgTmF2YXJlLCAKTHl1
ZGUgUGF1bCwgYW5kIERhbmllbCBWZXR0ZXIuCgpBIGRpcmVjdG9yIGlzIGV4cGVjdGVkIHRvIHBh
cnRpY2lwYXRlIGluIHRoZSBmb3J0bmlnaHRseSBJUkMgbWVldGluZyB0byAKZGlzY3VzcyBjdXJy
ZW50IGJ1c2luZXNzIGFuZCB0byBhdHRlbmQgdGhlIGFubnVhbCBtZWV0aW5nIG9mIHRoZSBYLk9y
ZyAKRm91bmRhdGlvbiwgd2hpY2ggd2lsbCBiZSBoZWxkIGF0IGEgbG9jYXRpb24gZGV0ZXJtaW5l
ZCBpbiBhZHZhbmNlIGJ5IAp0aGUgQm9hcmQgb2YgRGlyZWN0b3JzLgoKQSBtZW1iZXIgbWF5IG5v
bWluYXRlIHRoZW1zZWx2ZXMgb3IgYW55IG90aGVyIG1lbWJlciB0aGV5IGZlZWwgaXMgCnF1YWxp
ZmllZC4gTm9taW5hdGlvbnMgc2hvdWxkIGJlIHNlbnQgdG8gdGhlIEVsZWN0aW9uIENvbW1pdHRl
ZSBhdCAKZWxlY3Rpb25zIGF0IHgub3JnLgoKTm9taW5lZXMgc2hhbGwgYmUgcmVxdWlyZWQgdG8g
YmUgY3VycmVudCBtZW1iZXJzIG9mIHRoZSBYLk9yZyAKRm91bmRhdGlvbiwgYW5kIHN1Ym1pdCBh
IHBlcnNvbmFsIHN0YXRlbWVudCBvZiB1cCB0byAyMDAgd29yZHMgdGhhdCB3aWxsIApiZSBwcm92
aWRlZCB0byBwcm9zcGVjdGl2ZSB2b3RlcnMuIFRoZSBjb2xsZWN0ZWQgc3RhdGVtZW50cywgYWxv
bmcgd2l0aCAKdGhlIHN0YXRlbWVudCBvZiBjb250cmlidXRpb24gdG8gdGhlIFguT3JnIEZvdW5k
YXRpb24gaW4gdGhlIG1lbWJlcidzIAphY2NvdW50IHBhZ2Ugb24gaHR0cDovL21lbWJlcnMueC5v
cmcsIHdpbGwgYmUgbWFkZSBhdmFpbGFibGUgdG8gYWxsIAp2b3RlcnMgdG8gaGVscCB0aGVtIG1h
a2UgdGhlaXIgdm90aW5nIGRlY2lzaW9ucy4KCk5vbWluYXRpb25zIG11c3QgYmUgcmVjZWl2ZWQg
YmVmb3JlIHRoZSBlbmQgb2YgZGF5IG9uIFN1bmRheSwgdGhlIDd0aCBvZiAKTWFyY2guCgpNZW1i
ZXJzaGlwIGFwcGxpY2F0aW9ucyBvciByZW5ld2FscyBhbmQgY29tcGxldGVkIHBlcnNvbmFsIHN0
YXRlbWVudHMgCm11c3QgYmUgcmVjZWl2ZWQgbm8gbGF0ZXIgdGhhbiB0aGUgZW5kIG9mIGRheSBv
biBUaHVyc2RheSwgdGhlIDExdHRoIG9mIApNYXJjaC4KClRoZSBzbGF0ZSBvZiBjYW5kaWRhdGVz
IHdpbGwgYmUgcHVibGlzaGVkIG9uIE1vbmRheSwgdGhlIDE1dGggb2YgTWFyY2ggCmFuZCBjYW5k
aWRhdGUgUSZBIHdpbGwgYmVnaW4gdGhlbi4KCioqIEVsZWN0aW9uIFNjaGVkdWxlICoqCgpOb21p
bmF0aW9uIHBlcmlvZCBTdGFydDogTW9uIDIybmQgRmVicnVhcnkKTm9taW5hdGlvbiBwZXJpb2Qg
RW5kOiBTdW4gN3RoIE1hcmNoCkRlYWRsaW5lIG9mIFguT3JnIG1lbWJlcnNoaXAgYXBwbGljYXRp
b24gb3IgcmVuZXdhbDogVGh1IDExdGggTWFyY2gKUHVibGljYXRpb24gb2YgQ2FuZGlkYXRlcyAm
IHN0YXJ0IG9mIENhbmRpZGF0ZSBRQTogTW9uIDE1dGggTWFyY2gKRWxlY3Rpb24gUGxhbm5lZCBT
dGFydDogTW9uIDIybmQgTWFyY2ggYW55d2hlcmUgb24gZWFydGgKRWxlY3Rpb24gUGxhbm5lZCBF
bmQ6IFN1biA0dGggQXByaWwgYW55d2hlcmUgb24gZWFydGgKCioqIEVsZWN0aW9uIENvbW1pdHRl
ZSAqKgoKKiBFcmljIEFuaG9sdAoqIE1hcmsgRmlsaW9uCiogS2VpdGggUGFja2FyZAoqIEhhcnJ5
IFdlbnRsYW5kCgpDaGVlcnMsCkhhcnJ5IFdlbnRsYW5kLApvbiBiZWhhbGYgb2YgdGhlIFguT3Jn
IGVsZWN0aW9ucyBjb21taXR0ZWUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
