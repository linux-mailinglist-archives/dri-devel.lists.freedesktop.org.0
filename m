Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B028F2E9C2C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 18:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C7089FCE;
	Mon,  4 Jan 2021 17:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2054.outbound.protection.outlook.com [40.107.100.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E9589EB4;
 Mon,  4 Jan 2021 17:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCRJ7iwOGuYAA60+KXEt5LwppEfPporILYNuEvruZRuaKbFb0he+2nbe6X3XjZ1fsgIGXGEZeGJubhB2jqNw0of3zZDGXULWfbMqtc7Nt6Jb9cNe9l0wLRl28v6yVpwX24QCRliq3qA6chAMQR9dmIKzdNv/6Hiky1sz0UCnIlD06iSe42lEDbWh2hgVKJOocrRIpiGw5eCelVkXZTFQXp4QuX5DN1HeyR7CuBmfcQJguN/UJ/uXfAjfdxUuZSP9koyx9f4SGnfiZpZTcPVyABSBT0wKi2nCn1Oxt39VQdX6Z1ttq2BOnW7vGhGwkCTRYs/d/EJ6tnR+cbVL6YpAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jbUfLCRJBtETWWiZ0w+9OF0EysEsTt1NctlxqBtTVc=;
 b=Obrov6/OjC+7agVIWmHotYNrjVgpQ74fhaPtLwthfRgCzb22b8S9xnhch8gJPwMEqdZgmT+VlZhvs3NAQT9CymSHg4ee4cv6mnLZikVkmjwH3PUdbBtTV7EU5mVxmDQ4zORJPHZyvthtCLjqjdKEv4fx2YgucsR0DAdEDs1BuA6h3SInJF3sin5FBAE2W81QON2HJlk/WERo5s4DSNqfrWWQf7dpts2V6D128x8zuOsjQnx3fjQVc2q58gUwj7UdcpGKtwg5vBktYsSstuHjQBFoMF1Dyfbjz8o7H4SPVGnQtp61jy4lVsTT6/GUDOFBKU7v4iFDKwxMoVSHxCT9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jbUfLCRJBtETWWiZ0w+9OF0EysEsTt1NctlxqBtTVc=;
 b=0F5T5EpDAV55XuPz16yqd8o9c+VQAz0M3Qghe0nbFQ8Ae+hq2Ysp7/Zcino79dm2Ls5MsZZ02xs6mJ3ruzEzAjPmqGsiO3N8sM4iKGe1faAraoFNioZXPQpkjLe8CbQVFZOL5JHoyBkxSECC9A4MWSOXNrAsfpJ/a948U797fgQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 17:39:38 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 17:39:38 +0000
Subject: Re: Couple of issues with amdgpu on my WX4100
To: Alex Williamson <alex.williamson@redhat.com>
References: <4df8585ab0aac5abb1e9502d1d7cc49daa2a464f.camel@redhat.com>
 <83f4291c-abe4-2995-b4ba-9f84c9235d14@amd.com>
 <20210104094547.06a61444@omen.home>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ea539e21-aed3-8f23-74b2-5a214fa9fdb2@amd.com>
Date: Mon, 4 Jan 2021 18:39:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210104094547.06a61444@omen.home>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0152.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0152.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Mon, 4 Jan 2021 17:39:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 92fef155-8021-440c-9c94-08d8b0d7b580
X-MS-TrafficTypeDiagnostic: MN2PR12MB4192:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB419253CCB035E3FC708B4DE983D20@MN2PR12MB4192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5NtfG46gvhX6iQpy242owqQSj5HjgJ8sG+JrgosCjfC/uSasmJ1IdGzgWTOhvvgHF4s7Z1CENI064xM1keZDCPKJ6TX0dx8lqIjG+PW8qX/mjcskg1jn69JeQTBaUZYlO4kqBy0JEw7GrbakaWDcn1Msv4jkSb6IRxXISdqbpL9SqrdbexYAhpWhCTD0dzSW29tlaTxy5Hn/4hYplbQhwJHlFu/3PzBZwdhlwFRCgmNqZZpNcimf6GKye8U1onGrxrSndGAoijJ+f9sXkHGdG1jVDfbe82/Ax1trZTmUkYLlR+3wKzPb87GO0m0pGdOiy35d9VLvFznydeqzn7Rag/hyWs7rv6+ZooCJSHwFFk3GkK9S9bQhPz36iHHn5FrXt4QIZRI8KGQ46XuynBJKP2UOCGlDkB5cxTMju9vYMYLsE+7FVRT5xYFY31x8pgjM25W5A1uukRHSw9G5AslwXznUM4ZDlCwGMfTOLyuUtg5SNnlR8BKQCEe2Oj32SF3OvSeFoyAnG9zinQKkm3RDZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(52116002)(66574015)(2616005)(6916009)(66556008)(8676002)(66476007)(66946007)(36756003)(6666004)(83380400001)(8936002)(4326008)(6486002)(316002)(16526019)(478600001)(31696002)(45080400002)(2906002)(186003)(966005)(54906003)(86362001)(31686004)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dmc1TWV5aXVqU3FKM0FlOEI2M3RETGZCL1A5Rm9JYTNkL295OGU0WTdibDRi?=
 =?utf-8?B?cldma1Q1dUN0bTlIUHIxcHZFRURIeG1kMmJDNUorY0hoS2VVc3IwcHNqQ1RP?=
 =?utf-8?B?bjZLNWhlbmdYS0JtQm1ES0RHWkZvZmxyYTlCUnIrWW9sR2dXZHZnejltdWpK?=
 =?utf-8?B?L2g0QkRxdDROM0ZxcTd0amd3YVk1QXNUZzdid3FISlJwNzcya21sWDZBRXBu?=
 =?utf-8?B?SDZSWVRibjR2SFZ0VGVzU2RJbk1zaE5IdkFuQWRQOGMyanhCcGxqa0ZIUDYv?=
 =?utf-8?B?S3ZWZWk4NmtuOTc3YlpoM2tXY2ZrOVJ5YmpnV25BTXZrcTgxczdDK1gwckpj?=
 =?utf-8?B?NkNiTmwwWUZqeTliaUhBVGpPR2t4a0NUVE52eThiMHJSMmFZdllGUUhtTHdr?=
 =?utf-8?B?WjhmZFNzUTFPdmdWcUJxekZWZzNpYmlZb3NPTXFUYy9pMVdmemFrUmpSOEpZ?=
 =?utf-8?B?M3AxMGJsVEVzdFZEOFJHNmFPUFBjOFhHRUlRZVdERnk0NjY0dkp6ZU5WTFpv?=
 =?utf-8?B?bFNYSjRXQnpNZ29hQ0lEVEJrT2dKQTZqQUhIc29qd1dhc2pIUFZxczBETzZZ?=
 =?utf-8?B?YjBtazBLMFRUZDV6cXAvdExGbVpCdjBvNjZiZ2M1YVVsUkN6enlpd3pZaTJo?=
 =?utf-8?B?cGR4aThoT3RNTzN6c09KTWlwRXJOcGZFM3Bqd082TWJSVXd4UVlNZzRVL0tV?=
 =?utf-8?B?bHVHWFJXYXpweE54bTlVRjYvVXdZK1FCTldTc01pWjRtQ3JJZkZJR3lhWTVU?=
 =?utf-8?B?d0FsQUs2SC9GWWNQVklnYTFVcjBQYXZoa0tHQXEydHNrUW8rUjVRZENGQllS?=
 =?utf-8?B?TEhqR09rRjl1a2U4VjBGYktCOTNKOThBTGh5M3E2dFRFUm9hR0pMSENyRTVn?=
 =?utf-8?B?SUU5MHk0ZjE0cUhIOG9ob2JaVHVaU2s2MVBULy9yUCs2TFUrclRjS1NidFds?=
 =?utf-8?B?Rk4rZWYvRGxicWVwSjAycmU0eUVLRzFxWXp6emZ1SFRjclZUeUlMbVczNkJo?=
 =?utf-8?B?TnNDOWZFV3VjOStGbXJpWXNGc3plTGNvTGxRbTdXUDJPMnd5QUdXY0RscWhC?=
 =?utf-8?B?M2s2eC8wUnlkdjFwZkI1R3BkYWJ2WjZraHNIQWdkS2JpMFNaTDhyZkt2aHNM?=
 =?utf-8?B?dWJkSHBSSlJGU0NLVDdUb0t2UnZFMmMydW43K3M4bUppNVJ5b1pCN2RiZEQ5?=
 =?utf-8?B?WndqUFNCL0dkeTZDWE1qSkF4UFVqek9UNUpudUxaVGI1cHlad0xtK0c0VW45?=
 =?utf-8?B?UUFoMDdDMW9IZDdWV3pYRzd5U2JjVkUrMjVUNlkyWXU2VXJlWTg1U0FJZHZY?=
 =?utf-8?B?MmVCYmx2Z3FQa2JXTEhEby9tSzZOTlNVbURzQ2dUOHVqU2tXWU4xczhkcGZZ?=
 =?utf-8?B?d0IyN2NyS0NlczJJajRET05peXRocDJvbWR2b2QzckZBVG5UbCsvM24yeGFj?=
 =?utf-8?Q?3rEejy9Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 17:39:38.0768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fef155-8021-440c-9c94-08d8b0d7b580
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeLobBb7M/s23B9fGaoDEk/MaqYFhxgLAs1vsVu6TpRjVa+tWkEEPV8D/P+WfuVI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maxim Levitsky <mlevitsk@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDEuMjEgdW0gMTc6NDUgc2NocmllYiBBbGV4IFdpbGxpYW1zb246Cj4gT24gTW9uLCA0
IEphbiAyMDIxIDEyOjM0OjM0ICswMTAwCj4gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+PiBIaSBNYXhpbSwKPj4KPj4gSSBjYW4ndCBoZWxwIHdp
dGggdGhlIGRpc3BsYXkgcmVsYXRlZCBzdHVmZi4gUHJvYmFibHkgYmVzdCBhcHByb2FjaCB0bwo+
PiBnZXQgdGhpcyBmaXhlcyB3b3VsZCBiZSB0byBvcGVuIHVwIGEgYnVnIHRyYWNrZXIgZm9yIHRo
aXMgb24gRkRPLgo+Pgo+PiBCdXQgSSdtIHRoZSBvbmUgd2hvIGltcGxlbWVudGVkIHRoZSByZXNp
emVhYmxlIEJBUiBzdXBwb3J0IGFuZCB5b3VyCj4+IGFuYWx5c2lzIG9mIHRoZSBwcm9ibGVtIHNv
dW5kcyBhYm91dCBjb3JyZWN0IHRvIG1lLgo+Pgo+PiBUaGUgcmVhc29uIHdoeSB0aGlzIHdvcmtz
IG9uIExpbnV4IGlzIG1vc3QgbGlrZWx5IGJlY2F1c2Ugd2UgcmVzdG9yZSB0aGUKPj4gQkFSIHNp
emUgb24gcmVzdW1lIChhbmQgbWF5YmUgZHVyaW5nIGluaXRpYWwgYm9vdCBhcyB3ZWxsKS4KPj4K
Pj4gU2VlIHRoaXMgcGF0Y2ggZm9yIHJlZmVyZW5jZToKPj4KPj4gY29tbWl0IGQzMjUyYWNlMGJj
NjUyYTFhMjQ0NDU1NTU2YjZhNTQ5Zjk2OWJmOTkKPj4gQXV0aG9yOiBDaHJpc3RpYW4gS8O2bmln
IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4KPj4gRGF0ZTrCoMKgIEZyaSBKdW4g
MjkgMTk6NTQ6NTUgMjAxOCAtMDUwMAo+Pgo+PiAgIMKgwqDCoCBQQ0k6IFJlc3RvcmUgcmVzaXpl
ZCBCQVIgc3RhdGUgb24gcmVzdW1lCj4+Cj4+ICAgwqDCoMKgIFJlc2l6ZSBCQVJzIGFmdGVyIHJl
c3VtZSB0byB0aGUgZXhwZWN0ZWQgc2l6ZSBhZ2Fpbi4KPj4KPj4gICDCoMKgwqAgQnVnTGluazog
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGYnVnemlsbGEua2VybmVsLm9yZyUyRnNob3dfYnVnLmNnaSUzRmlkJTNEMTk5OTU5
JmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Qzk0MjE3NmQy
ZTZhYTRhNGYzYTQyMDhkOGIwZDAzMmJkJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4
M2QlN0MwJTdDMCU3QzYzNzQ1Mzc1NTU0OTk2MDYxNSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhl
eUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZD
STZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT0zcnNSJTJGeDR1VHBqdFhGTnFsSnlGQnRlTW1aTWpX
ZjNOZWNpN2xVbGtoODglM0QmYW1wO3Jlc2VydmVkPTAKPj4gICDCoMKgwqAgRml4ZXM6IGQ2ODk1
YWQzOWYzYiAoImRybS9hbWRncHU6IHJlc2l6ZSBWUkFNIEJBUiBmb3IgQ1BVIGFjY2VzcyB2NiIp
Cj4+ICAgwqDCoMKgIEZpeGVzOiAyNzZiNzM4ZGViNWIgKCJQQ0k6IEFkZCByZXNpemFibGUgQkFS
IGluZnJhc3RydWN0dXJlIikKPj4gICDCoMKgwqAgU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+PiAgIMKgwqDCoCBTaWduZWQtb2ZmLWJ5
OiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgo+PiAgIMKgwqDCoCBDQzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZ8KgwqDCoMKgwqAgIyB2NC4xNSsKPj4KPj4KPj4gSXQgc2hvdWxk
IGJlIHRyaXZpYWwgdG8gYWRkIHRoaXMgdG8gdGhlIHJlc2V0IG1vZHVsZSBhcyB3ZWxsLiBNb3N0
Cj4+IGxpa2VseSBldmVuIGNvbXBsZXRlbHkgdmVuZG9yIGluZGVwZW5kZW50IHNpbmNlIEknbSBu
b3Qgc3VyZSB3aGF0IGEgYnVzCj4+IHJlc2V0IHdpbGwgZG8gdG8gdGhpcyBjb25maWd1cmF0aW9u
IGFuZCByZXN0b3JpbmcgaXQgYWxsIHRoZSB0aW1lIHNob3VsZAo+PiBiZSB0aGUgbW9zdCBkZWZl
bnNpdmUgYXBwcm9hY2guCj4gSG1tLCB0aGlzIHNob3VsZCBhbHJlYWR5IGJlIHVzZWQgYnkgdGhl
IGJ1cy9zbG90IHJlc2V0IHBhdGg6Cj4KPiBwY2lfYnVzX3Jlc3RvcmVfbG9ja2VkKCkvcGNpX3Ns
b3RfcmVzdG9yZV9sb2NrZWQoKQo+ICAgcGNpX2Rldl9yZXN0b3JlKCkKPiAgICBwY2lfcmVzdG9y
ZV9zdGF0ZSgpCj4gICAgIHBjaV9yZXN0b3JlX3JlYmFyX3N0YXRlKCkKPgo+IFZGSU8gc3VwcG9y
dCBmb3IgcmVzaXplYWJsZSBCQVJzIGhhcyBiZWVuIG9uIG15IHRvZG8gbGlzdCwgYnV0IEkgZG9u
J3QKPiBoYXZlIGFjY2VzcyB0byBhbnkgc3lzdGVtcyB0aGF0IGhhdmUgYm90aCBhIGNhcGFibGUg
ZGV2aWNlIGFuZCA+NEcKPiBkZWNvZGluZyBlbmFibGVkIGluIHRoZSBCSU9TLiAgSWYgd2UgaGF2
ZSBhIGNvbnNpc3RlbnQgdmlldyBvZiB0aGUgQkFSCj4gc2l6ZSBhZnRlciB0aGUgQkFScyBhcmUg
ZXhwYW5kZWQsIEknbSBub3Qgc3VyZSB3aHkgaXQgZG9lc24ndCBqdXN0Cj4gd29yay4gIEZXSVcs
IFFFTVUgY3VycmVudGx5IGhpZGVzIHRoZSBSRUJBUiBjYXBhYmlsaXR5IHRvIHRoZSBndWVzdAo+
IGJlY2F1c2UgdGhlIGtlcm5lbCBkcml2ZXIgZG9lc24ndCBzdXBwb3J0IGVtdWxhdGlvbiB0aHJv
dWdoIGNvbmZpZwo+IHNwYWNlIChpZS4gaXQncyByZWFkLW9ubHksIHdoaWNoIHRoZSBzcGVjIGRv
ZXNuJ3Qgc3VwcG9ydCkuCgpJbiB0aGlzIGNhc2UgdGhlIGd1ZXN0IHNob3VsZG4ndCBiZSBhYmxl
IHRvIGNoYW5nZSB0aGUgY29uZmlnIGF0IGFsbCBhbmQgCkkgaGF2ZSBubyBpZGVhIHdoYXQncyBn
b2luZyB3cm9uZyBoZXJlLgoKPiBBSVVJLCByZXNvdXJjZSBhbGxvY2F0aW9uIGNhbiBmYWlsIHdo
ZW4gZW5hYmxpbmcgUkVCQVIgc3VwcG9ydCwgd2hpY2gKPiBpcyBhIHByb2JsZW0gaWYgdGhlIGZh
aWx1cmUgb2NjdXJzIG9uIHRoZSBob3N0IGJ1dCBub3QgdGhlIGd1ZXN0IHNpbmNlCj4gd2UgaGF2
ZSBubyBtZWFucyB2aWEgdGhlIGhhcmR3YXJlIHByb3RvY29sIHRvIGV4cG9zZSBzdWNoIGEgY29u
ZGl0aW9uLgo+IFRoZXJlZm9yZSB0aGUgbW9kZWwgSSB3YXMgY29uc2lkZXJpbmcgZm9yIHZmaW8t
cGNpIHdvdWxkIGJlIHRvIHNpbXBseQo+IHByZS1lbmFibGUgUkVCQVIgYXQgdGhlIG1heCBzaXpl
LgoKVGhhdCdzIGEgcmF0aGVyIGJhZCBpZGVhLiBTZWUgb3VyIEdQVXMgZm9yIGV4YW1wbGUgcmV0
dXJuIHdheSBtb3JlIHRoYW4gCnRoZXkgYWN0dWFsbHkgbmVlZC4KCkUuZy4gYSBQb2xhcmlzIHVz
dWFsbHkgcmV0dXJucyA0R2lCIGV2ZW4gd2hlbiBvbmx5IDJHaUIgYXJlIGluc3RhbGxlZCwgCmJl
Y2F1c2UgNEdpQiBpcyBqdXN0IHRoZSBtYXhpbXVtIGFtb3VudCBvZiBSQU0geW91IGNhbiBwdXQg
dG9nZXRoZXIgd2l0aCAKdGhlIEFTSUMgb24gYSBib2FyZC4KClNvbWUgZGV2aWNlcyBldmVuIHJl
dHVybiBhIG1hc2sgb2YgYWxsIDEgZXZlbiB3aGVuIHRoZXkgbmVlZCBvbmx5IDJNaUIsIApyZXN1
bHRpbmcgaW4gbmVhcmx5IDFUaUIgb2Ygd2FzdGVkIGFkZHJlc3Mgc3BhY2Ugd2l0aCB0aGlzIGFw
cHJvYWNoLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPiAgICBJdCBtaWdodCBiZSBzdWZmaWNpZW50
bHkgc2FmZSB0bwo+IHRlc3QgQkFSIGV4cGFuc2lvbiBvbiBpbml0aWFsaXphdGlvbiBhbmQgdGhl
biBhbGxvdyB1c2VyIGNvbnRyb2wsIGJ1dAo+IEknbSBjb25jZXJuZWQgdGhhdCByZXNvdXJjZSBh
dmFpbGFiaWxpdHkgY291bGQgY2hhbmdlIHdoaWxlIGFscmVhZHkgaW4KPiB1c2UgYnkgdGhlIHVz
ZXIuICBUaGFua3MsCj4KPiBBbGV4Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
