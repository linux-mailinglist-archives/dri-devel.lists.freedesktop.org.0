Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3374AD327
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B05810E41D;
	Tue,  8 Feb 2022 08:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193D710E1CA;
 Tue,  8 Feb 2022 07:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zc11PBepkIhhfVzXAMPzlvIxGK1ovg18TOeYIb2trDnBIKbsMByIEAESsVHmNoj9C51OsBc/VcPLbmsiQEktqgbMfu5IwwMhiKlqjRUQUyESLLGKZvn1ed8uN7ohuFj0LvTQifSs4jDFckFqeSYN6OHmNO4QE9QW6ZXKn7ey3K1eRyK530WAi2r33d7wc0w4l6jcKyUFdNrqkUKrwUaheuxUCsrEp21rxu8LrxkmAP4qfNr02KfkW8MvuL8zVQW3UwEUMLr/edZwjVEcTItjsaOqa03iN4n3ttvvW7VZDTq9rI2/gHcPITnFu/k4BdMZGRclLYCxsRuY01WT6oSfuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8q/4zI1jS6JjTLdnIqKkTdN4Hm+lMd4J5XLJen7qes=;
 b=EjXw+tjAI6gozXk/lfUVTNip+Rts5KQZ54/Mmg8Mi9WPFTkH8TstouuYI2lUdyx++X3dWYSes2FwQ5ymKgj3MYviSfy6KPuoQAYrA39L7P6aJS+sDxyNBVKQ/ErwcnsK9JMqCDoPammIUK+Wbu2P+g60EAjduSAkrPkBa/1wtpdHLke6uXdW+crdKkRL3jvaBLzFvJBxcd3WBmGczBhe2zv/LBv9483O/Wnp1A2UH14pyOnrBIN5VNtaW7WMcQ6+RpvJxfBy5mdtE66SofV9K6fJV2uCpo0P4qI19P0uAfA+vH+vUgijAIF9aGyIDxVFM9T6gq/DbdczJut/mP4M1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8q/4zI1jS6JjTLdnIqKkTdN4Hm+lMd4J5XLJen7qes=;
 b=YutiRvV0kYBF/uO/q6c8kECqZkhOO3Xj9NqOUOF+IYW98STiNI/++QLqgRTmz2vQL3/xvX+tUje2D4v8IdsRhrfokjS1ly2J3wFTHNfBPeKPoDpmLz8JKW6e+1V/LFEUAJ9VxO/Z38Fjsog52n8ZKSNQWrcOLc2/f6LZ+tKQwmrDaPDPYZtzb5q2X0+gb71Z4vn9XoPb6gd9KwCjDIIXx7aI+1OX9vIKonEUoMX/V2Q/eHE3JrU6A0X35T5KZqqXWjD5tvceipIfzen7xF3860iXqpItk2iEKq3dadZnX7FkLzdBKub3qK3qPAxHjahyxyZe98ClVm+a6GFYpFPnnA==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by MW2PR12MB2540.namprd12.prod.outlook.com (2603:10b6:907:7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 07:27:13 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:27:13 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 3/8] mm: remove pointless includes from <linux/hmm.h>
Thread-Topic: [PATCH 3/8] mm: remove pointless includes from <linux/hmm.h>
Thread-Index: AQHYHL1KFWrmtpKy9kCMb8iR/ZhaJQ==
Date: Tue, 8 Feb 2022 07:27:13 +0000
Message-ID: <dc0e65c7-e6aa-68d9-10b7-587f464824a5@nvidia.com>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-4-hch@lst.de>
In-Reply-To: <20220207063249.1833066-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14c5de55-0993-4fcc-917b-08d9ead46d56
x-ms-traffictypediagnostic: MW2PR12MB2540:EE_
x-microsoft-antispam-prvs: <MW2PR12MB25405CB469A431D0EFF24ED5A32D9@MW2PR12MB2540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nn/FliLEJ1YrK65AMlKHhNYKgIILRtzpLGJjPjBUF3GRoU7wYmdCyyr0RXdY+IZsWX+UY9iKyuUJ4+Tw4hMABD3ufq6GPIyFLIDCJAIDdmr5XJVM3DmBZoUGedU3pXJ+kAk1lmDOx/fkTUoxJlnLaN8bhEIYE5uJwj72ndZtGMuHUZP/oWCHEPnA9wbMAmtnYxyueqtgQMFYRLPJnQR0RFH1PLzFKvgHEgyaNGyKXwZhZBkje7Fg9EzON3i/evRxEfNHxVJA/GzzNMeZU0ruBT98e9YVhs0auozQrx6UDBGjRnNqutQ4C70zHNwJrMrmYwGp4OUF2KXFpxlI/HxPFsYdCa47L5VQxbw6/NStdDcJY5XB/YyE2juJKIQafb4/6z+rbwVvCHKyfcIEcWUesShqCVmE0UyIK4k/iO4hGoBtXxB58Jq2yQPcCP9jElJGTqsBDBc+56Nq6Ig1yE21RtEzRfztvu1jj7vY8CvtzcOC6jOf+R12Y6EqicIyPTp6pEL3PnkVe8umf2VuXVmJq9hhthqXgIHbyLwEzmqBEo2sCcoGySsWDzd3Nc8B/SrWH6AyYAZzlRbhEqvtlZuxzOv0oG5ojyki+394FmQBobOChhchqgPabssHkRg/dnAKVXnOiPq3JbtJHNpfg6GBei5Q2TD4WM93EkcoECYnBJLEGzmAxG2VIqHwsXpx3fdUlWVkXUc+Ik59UI/9+dr6mOP6Hr15Se1L1rAjC+wPnNELXbViNimc7eqKFwP86y6iBHXUuSyfJkq+g2fUlBRimg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(5660300002)(122000001)(36756003)(186003)(31686004)(2906002)(6486002)(558084003)(38100700002)(110136005)(86362001)(53546011)(6506007)(316002)(508600001)(76116006)(66946007)(2616005)(54906003)(91956017)(8936002)(66556008)(66446008)(64756008)(66476007)(6512007)(71200400001)(38070700005)(8676002)(31696002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N29Ca1RrTzRuNjFqVkJ5K1RJOWRQbUM2TnB0dmQzRVREbjBWdjh6Wm4zSHhV?=
 =?utf-8?B?K2ZzdGFVd0FIT0xtWWFuY29IakNWUkI4RVIvbUMzVFhYeExYVW8rb0ZFaG9G?=
 =?utf-8?B?dFRpcG9QdXZxN0pjZ05wUnFxS0d0YXplK3Q4QWxwMDBpSDhvQlhmSlRYSStq?=
 =?utf-8?B?S2E2TFlzRnlGTGNXTHVUWThWTlRiS0M4Vi80SEIxM2doK3VpODNpYVYrMExE?=
 =?utf-8?B?T1BWYVpHcEx0VGhtQWpCQk1EejZKcFVUQldnL3Y2M2t0Q0dJaUpPV0JvWnRk?=
 =?utf-8?B?dlNDRWwrL3lSbVc5M0MyZGhzREs0U1FaRGxCZ3JCK01HRmJBMWdaMEgvTnVU?=
 =?utf-8?B?ZG5PTzhSN1E0TkNueEFGUnRBcXVtaXU0TVp1SFZSN3R0MHJuVzhPRFhQNkhm?=
 =?utf-8?B?VktiZnlaQ0NhSVVUc1dneGxnUDZQT0tSQ1BLMHNtRVZwMU1VTVQ3SWQ4NmtI?=
 =?utf-8?B?bWgvRERZV2FoazJxMXF5cjZwNG05YXpBNmY3TFBRTElOb1VMOS9BTWMrY1pO?=
 =?utf-8?B?RGdSZ0p3ODcyd0JpRVFOb3dkQ1hWYXBxYWVFOVdGbVUvZUlQT2FEN3NUbEZU?=
 =?utf-8?B?NUxvTElnZnRxUks5VVZaY2VManVUMGxOTFZYNXFRNGlyNUxUc2tOdWZudFYz?=
 =?utf-8?B?M3ZTSVhmdUs4WE5xYTIrR2FyWDBKUXJ1bGFBSlJucUdWQTk0N3YydWxyaDVn?=
 =?utf-8?B?N0xDcWFWdnFQZ2VYSXhBaGJ1ZFVqUHBoUTF3YllsUS9CSVBQWGVHalF2Smo5?=
 =?utf-8?B?TjV4RjhrSVYzNWpEV0hDQXVVWlhKSyt5cEN1aVROWUtxM0EvOFVFTzJrT0RE?=
 =?utf-8?B?TFhTaWJXOTY0UHVHVm4rSDFwT3Q1Q3BZVHVUN3hHVnFBY0lGWXNXWlh5ZHhK?=
 =?utf-8?B?a0hNbmFrbElDNHRvTW0wOVZPUkZNYmJ2RE9pT1ZXanhIbkZ6SjR1OUdzOG5p?=
 =?utf-8?B?MTZsY05Vbk5GMVgzZ0s2Szc0TWtBbnZORTZCU1J3bHFzTmtTaTZiWlZVOURL?=
 =?utf-8?B?NDhuMHUyNlplclhlc1lWRDd0TEZQLzJKWDE1WVZMMng5ZEJRV1R1M2FQY251?=
 =?utf-8?B?ZHhwQWNqS0s2NXlhOEUvUWZyWVVPc1RtUmpWNlFMVEZKdkNLa0hleWxqYno1?=
 =?utf-8?B?VUF4RFBqbTE1RnJ4cm9sc09Jc2F0MmtYOU9tbVZCL1R4UnhRZHhWTForaGo4?=
 =?utf-8?B?a0FnNXV4TzZNR0JWR1I2VFU4N3d2dHhUMk1LVlBmWUNneWhDT2FGRnVEQmUz?=
 =?utf-8?B?dWtPK3IxR2RLcld1dXhqem1Wa2VLTDY3R2diZjZ5aEpiRDVKNFFBRzY5Qzd5?=
 =?utf-8?B?dmpld2p2bytIdklzRXNZTFZHSWFNQzVpVFJhZ1RibmlvSFpuOUt6dklLYmFO?=
 =?utf-8?B?RHlBMktWOFVnSXVzMzZSVXJnNGxienMvOXFXTFFNempNZUxId2ludzlQYWZs?=
 =?utf-8?B?MzdVNnc2d00rT2tyZlluTWNLRU5vbkZJOEdoa0tXTTcwVmovQjlZNWNEdndM?=
 =?utf-8?B?UUoyR0tLMU83d0F4TmY1QjFkN2M1aU1oNUM3UkVoMGlGMW5jcnN1RisrbnBT?=
 =?utf-8?B?VWVTclVNNDlxamZWK214dzlyV3RZR3VEZkJRWlNyVm1nS1U5NWxlVFRpKzdI?=
 =?utf-8?B?Y2hsQnNqNDJQM0RpOE9LZDNVWjdER2xaTWxOeFVJZjhtOEdOLytxNmFNNnov?=
 =?utf-8?B?OGN5ektTdldwNS8xV0RmVVhUcTJQd2hCZVZoUVNYdXJ4MlVqYS8wVTFLYUZm?=
 =?utf-8?B?RWdnUTVyeU1EekhtRUhUTmNDZ1NIdkdjMTRVeEt6S1A1ZVNJV2VTdmZMTHBu?=
 =?utf-8?B?WlBsZlNqSEduUDg4ZE5GNHJRdWNWOVFFWTVKU3NtVmpTZnFMVzVieG1qeEdq?=
 =?utf-8?B?eEU4czdqZzJvY3lxWmlaWUpXcmR5cTBpUmJoQkQzYnZ4NzBTa3REK2Fxd05t?=
 =?utf-8?B?TmRxNlVxNFBIbkNzeWVwMW0wd05EenlFMDcremxZblQ1V0MzNVpsblpMQnJw?=
 =?utf-8?B?VW9iRU8weGdGdk92YnJraVBLWFRQVkdpakp4a0cwODU1QnRqd3NPRDRMSE1L?=
 =?utf-8?B?dHBuSHI0SlFIaVBEekhmbUd3OW5EQlNHVFMxVUpGc1I5dGxuR01ZelMxZ1Nj?=
 =?utf-8?B?K21pMW15VWRVVlJ0QkFIUzAyYnE0VHJ4UVVyajRoR2MyTkRtWmlHamw1QlhJ?=
 =?utf-8?Q?OIn5hgNF/IF1Bqz1nlF8RzmuCPmI8qryFJiKe5RAJqqY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7B08F8BDFCE8249BF528D0F262D3B7A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c5de55-0993-4fcc-917b-08d9ead46d56
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 07:27:13.6585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lct9XUMZ30uJtfOG/igumoucyOl2JK8GIIP3bN9Xc2FDSccH0FpxfLNVZ8rjKPdXHt5D2QgI6zm1K5c4BE/Kpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2540
X-Mailman-Approved-At: Tue, 08 Feb 2022 08:23:40 +0000
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
Cc: "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi82LzIyIDEwOjMyIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToNCj4gaG1tLmggcHVs
bHMgaW4gdGhlIHdvcmxkIGZvciBubyBnb29kIHJlYXNvbiBhdCBhbGwuICBSZW1vdmUgdGhlDQo+
IGluY2x1ZGVzIGFuZCBwdXNoIGEgZmV3IG9uZXMgaW50byB0aGUgdXNlcnMgaW5zdGVhZC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnPGhjaEBsc3QuZGU+DQoNCkxvb2tz
IGdvb2QuDQoNClJldmlld2VkLWJ5OiBDaGFpdGFueWEgS3Vsa2FybmkgPGtjaEBudmlkaWEuY29t
Pg0KDQo=
