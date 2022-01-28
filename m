Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 564E249FC54
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 16:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47A710F3A9;
	Fri, 28 Jan 2022 15:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D62010F3A5;
 Fri, 28 Jan 2022 15:00:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igNGC0LwPe6ezBl0aAGFoqe09mqcP0uf4R8dyLuppFyQqCNNrGHlMZktICNQwSAQcnOA5c31mzADh1zsh5ok08uE7zFFEbL84BhgmAGkhZqX7xnR9o3oZTIWJ1Fz/Nw7nDB1TwM50UF6Rnv45ejsMzbsV7nJc9fzZhygArECVxNV21+mT1peFyOcen9eMEwDb6MsxrpQx8NymS86HtsXU0GWX+RCh6Bmf9L6R+s+iDV1m0TJAxpYizhmzjLTTtLoVrcXiG0ggetMgr/La5dW9rk8D7KOIl54ggaRj4rj0tSyRjDkkKcDJ6Mc3zk38Nl8ge8UN6Av/nCC2me/y8hIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHVJYmw2SwM4zfZeQMMwHrT68MP+QFqaAGadUOqBAng=;
 b=V1G+TK40EBd0nuZD04nPKVZlN4JvoKzaL4Rq2bOYCSwX2NAb51zz7KgC8Yng5xhXOh8/X2GRx8fjeClpLPudzWow8NTjH2Na1H/PA/OtED9YuxJ35baQ00A2BKEaJfXZi3OiZwnDTbsQfTOQjpvz8EbfsUzuQei5sWt9DazJ2i5ARk8sC5GZSetkgkCLF1DzJH+1zoAkXvgJiy35a6Pvw1mQSauBLgmwDBPO8akS4K34j82L6frUmHhTTUcloum9cKEv3nw2UOQIp6NNN7CppMYA1CeRbdmdYx3KDB4mIlD4VUQmv5iGSd6ck4elMiCWjqtMYifMJATAhDLNKJCk3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHVJYmw2SwM4zfZeQMMwHrT68MP+QFqaAGadUOqBAng=;
 b=jTdMmOAaTj7yOfvDyT1U+9OJLdO7aT3V+/1CW/dPmmbNz3OGu4yMQg0E8XMEE3OA6VT2z/3wpTVRCx0QdisXfRfW5s6rSh7yo+yGd45CQKUIUDnUW7Oh2Zv9n9IyslTP7WmE26JmPTpjAQPow9/dM1+Lg/fnn0YwUsq1ylQJW58=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BY5PR12MB5000.namprd12.prod.outlook.com (2603:10b6:a03:1d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 15:00:55 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::99d4:4d4f:653f:61be]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::99d4:4d4f:653f:61be%6]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 15:00:54 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: RE: [PATCH v4 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Thread-Topic: [PATCH v4 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Thread-Index: AQHYEytsP/67TKGTNUyftqwPUBqvoax3dVQAgAANVACAAQZssA==
Date: Fri, 28 Jan 2022 15:00:54 +0000
Message-ID: <BL1PR12MB5144C93A17CF84DF88FF6C52F7229@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
 <20220127143258.8da663659948ad1e6f0c0ea8@linux-foundation.org>
 <6434ba24-a219-6a5a-d902-0b48974a0e43@amd.com>
In-Reply-To: <6434ba24-a219-6a5a-d902-0b48974a0e43@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-01-28T15:00:02Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=4d065683-7d66-4a8a-81be-d6179352ba83;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-01-28T15:00:51Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: d1cab3e0-3848-4587-aea4-8073f5e88a3d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c779014-ce48-4180-79a6-08d9e26efbdf
x-ms-traffictypediagnostic: BY5PR12MB5000:EE_
x-microsoft-antispam-prvs: <BY5PR12MB5000B38933DCD2A69B1328DDF7229@BY5PR12MB5000.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e9TOoUOsc08fko6Q1cp6QDlTn7vS6+l8Rvz+3m6KPgLBCwMeOBqTnDIALt//tp8EErMKIDVAwOAYyHLkYdtJEgr6w/9kfYjopcTJtKLTdMSkpFifiNr11TGdD4WJwFrqOmzcsBsEKhJTuaQwzK1Fx+yqbUgCVfho3xYcYA6Zlf5ia/NgwyEqJ0dpzN3R+XdmDt3gD2HGNN/6Y9gB0ltawPMJho5WVneLD8DigOZWbII+/rwvTkanUIyDyowEoMQPxbq+gwlQRL2O8au7OlEKgQqBNOBFmOSkh4Q7APnZyer5aD4As4Xy0IXHChMml58HBPGF8pjui+xabXXq/0kt7MhJ44VZOrBfQeH4JQIDrWy+GX4c9KxWHlOiSHH7wC0OrSvP08RF8NMpPYl2Gt9b7v13f3jdDEPsPFmzbkc59LDQCp8PGuYge9m5O6K+9tZS2c5dSBvoD77Y5Jjwdwvd4w24vfMdsNJ5ERlGthycyPZQY9B6BK4crsI1an2VEHCRTReOsm2UWtIW6zVXMkyRJJvbc57uFX4aHSRWr3Ix9hXs8eLF6BSZLDN6XtqWInrjhgcnGFy0xb3n1CUBrJkWmMNIMcsTI/VsvupyHQWOZNNt4mg1qSg43nS9+LgcpknrOQ6rFDjyHT0Xy2osFYEuE/kuOG4ELceYARpPYflUxUUApWecbs0/FkZ0sCnQO5yLbSB6umqshZq5OkgL1cOEnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(110136005)(5660300002)(54906003)(6506007)(7696005)(9686003)(316002)(7416002)(53546011)(66556008)(4326008)(86362001)(8676002)(8936002)(55016003)(33656002)(122000001)(508600001)(64756008)(66476007)(66446008)(76116006)(66946007)(38070700005)(38100700002)(26005)(186003)(2906002)(83380400001)(71200400001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWMwaW1JV2hEa0FKNE5PdmhJckdpSHZPMU9ua3BzSmR1dFJocS9aRHFEK3lU?=
 =?utf-8?B?VkM4Y1lYNHJKM2dINnUvcktBVFZJRENBYlhORFVuTjVCSHRjejQ4ckNoMzJl?=
 =?utf-8?B?UWJZUk11dVp5eVM3NERvUWwyRlBqVkxNek90T3V4V3lhZW44bUJCbzk4RDBa?=
 =?utf-8?B?YWExTnlST1FQWndTVWVXbmNQdU9CQzZpY3FhakRHdm1EN09TVHFQdkFnTkJI?=
 =?utf-8?B?cXgycjVCcndSOXl2c3VnRFVlZ3FDK3pYNmcwWThpWTIwdGVCbDM5Z0pDbVRZ?=
 =?utf-8?B?bjNvYVN5RFBJVHRjWUZZM3UxWDUvZkUvV0lrdmNabFNkdlZ2WFgyZDB4dUpC?=
 =?utf-8?B?Y0xlY0l2bFpHQ1djNk05eFZHcjZwSjhmb1c1SnJqYUF1c0pyd1diVWEzeVN1?=
 =?utf-8?B?KzFWQWhCRmFCNnB5UDRmU1FhTjkzWHQ3end3RjlKQStINW95YUJjNmVoWjAv?=
 =?utf-8?B?Y1QyOHFNcDg3SnFzSTRPRWR5UWRHR3BtYUFybXM1d2lmTFlDK05rSHhTTytF?=
 =?utf-8?B?ZWVjWnovaVgwNVYvMmYvWTBLV1NFZmh4MEcwRjJwMGhPSW5RUDkwMFRQUTA5?=
 =?utf-8?B?SXM0WnhnWnAxNytnMzFjK1FWR2UwNXhKY0FYaktFQys2Q2kyNnBxRGJrYnIw?=
 =?utf-8?B?YTJkc2o4cUNYYzFHOGhjMGxTSWlpUDM0MXBFRzF5clpFc1Z6NzlhL0s5TEdn?=
 =?utf-8?B?U3BqZWVVd1hLU0Y2Q0hPb0l4dHZUZHJ6amlRVlB6bC9CZEt3SU91TUxkWFM3?=
 =?utf-8?B?S3JGUnE3eVVsZ1NLb0hxWkNjbzM5c2lhUFEvaXBzUmNtNVEzajZSK2lMbHpT?=
 =?utf-8?B?TEptNUVOaUpqM3Qza2F4T3pESldwb3ZhWXdiVEFhNG0zYmp5WWNkR3pkYkxw?=
 =?utf-8?B?VEFDc05EYStvV0oyNUNkcHlqSXNDV0ZGUmVSWml1dXN4V2Y1T3YyNFBrL1ZH?=
 =?utf-8?B?VEZnYVFheDhKczZWcEZTRjh0RHdkOW1YMVdDaG40dXIwSnBoQzg0SGNGOVgv?=
 =?utf-8?B?TDZQNkhqTFVZQmUxQ0Q3Nm9haUtrU0RBM1duZlVtekhWNmFWNzFBTU1HbXNF?=
 =?utf-8?B?c0U2dllIRlYwNGU3ZldjeW5scktaTUpjUDAxbVlmV0g1M3dJbVk5aWU1NUVa?=
 =?utf-8?B?dmptQURFWnVqUGNQWGhLRGNPeU5QcEllU0dtdlBOVHNwQVVqK0l3OXVIem4r?=
 =?utf-8?B?ckx4OVA3dEs5b2VzcXlRYnpBYlE4b21xZjhCekV4QjROR1owSkpJQkVyMVhE?=
 =?utf-8?B?dnZkL2w5cVBXSEoxUE5BdjFCNFhyWTB2NFFNRGFtbkNKNXphRU5uNmh1SHBp?=
 =?utf-8?B?RE40V1J3NEJabjlWbmVmc3IrbzIvRFVwcWdMNll0V1NXL0xzQzFIVCtFc2la?=
 =?utf-8?B?Nkt1cyttTzJ0WkdaaFZvMzVhdGpmaWFtV0piaGdkU24wQVZqdExOWXU4amxE?=
 =?utf-8?B?ZXZlZzVQejdJR1Z1c0dlTUhPRUVQVm1RdjkvOUxRSWNDTXNXTzNmcmdVOHZC?=
 =?utf-8?B?R05YZ0hnQVByUXN0ODZuTUhKaDVZcnpxVS9CZW1WK005TXVpa0o4U3VGSkxP?=
 =?utf-8?B?VWZqTHpHbmsrbWhHTlJIWWVyQ3RHWHZBNGpua0tISzY5MHZrYjNTQytqeUt1?=
 =?utf-8?B?b2dvTHM5d1E5OUVtTFBRZVArRk5PM0c0TFZiWXNZZGh3ay8xQSt2blpjMTdu?=
 =?utf-8?B?ZUlQV0dhbmdpS3Y2ODFhczNoLzMzMUVtTWJWVzNzWHU4ZXdMYmlTcXhveXhS?=
 =?utf-8?B?T2VtdE5UWEhldFVXOURlUCtPM1ZpbFprcjhMdmYyOWJwekZ0TWFQZCtHbHdp?=
 =?utf-8?B?MG1lY2xLSG9sa3ZQV2tzZ0hPUFlxWExuOVdPZ2RmQ1ltbmU5bFZzUXhFZDM0?=
 =?utf-8?B?aW9Zd1F2S3pUYUhFclJiMlhpeHpkektHTU96bGZzM1Z4RG1JeUxLeFoyZ01B?=
 =?utf-8?B?UjFEdDBaYSt4bU9RTHdiMHBVRXU0MkF5M2RPSmFpWDlYNHRXU0hBOGh0ZHBu?=
 =?utf-8?B?dk1jMzBWUG9uY1BCZmZxYkxaekdvYUNHNVJaeUhOTHlSa0hFbFdrUk5URjI3?=
 =?utf-8?B?WkJZRWlkOWhLcDZ4bEJud0lmNWkwQzNjNk0ySS91a1EwUnpmTk9xWFpjRDlZ?=
 =?utf-8?B?dlJVa0YvVXJ0SEkrVkdnckt6RXhsbXBGMUlkaEJMc1llNHFpRi93bkp6U3E1?=
 =?utf-8?Q?eERp0kupX/PRBjatVywmgso=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c779014-ce48-4180-79a6-08d9e26efbdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 15:00:54.8392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4s08jiUelrq1+F0+IZdt1AinPw9EFKw+Ze1RN64k1tBullpgxR3UJjyKQl93057d2nuio61N+6EJLiHlBZWEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5000
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "willy@infradead.org" <willy@infradead.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "apopple@nvidia.com" <apopple@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaWVycmEg
R3VpemEsIEFsZWphbmRybyAoQWxleCkgPEFsZXguU2llcnJhQGFtZC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBKYW51YXJ5IDI3LCAyMDIyIDY6MjEgUE0NCj4gVG86IEFuZHJldyBNb3J0b24gPGFr
cG1AbGludXgtZm91bmRhdGlvbi5vcmc+DQo+IENjOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+OyBsaW51eC1tbUBrdmFjay5vcmc7DQo+IHJjYW1wYmVsbEBudmlkaWEu
Y29tOyBsaW51eC1leHQ0QHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IHhmc0B2Z2VyLmtlcm5l
bC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktDQo+IGRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgaGNoQGxzdC5kZTsgamdnQG52aWRpYS5jb207DQo+IGpnbGlzc2VA
cmVkaGF0LmNvbTsgYXBvcHBsZUBudmlkaWEuY29tOyB3aWxseUBpbmZyYWRlYWQub3JnOyBEZXVj
aGVyLA0KPiBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjQgMDAvMTBdIEFkZCBNRU1PUllfREVWSUNFX0NPSEVSRU5UIGZvcg0KPiBj
b2hlcmVudCBkZXZpY2UgbWVtb3J5IG1hcHBpbmcNCj4gDQo+IEFuZHJldywNCj4gV2UncmUgc29t
ZWhvdyBuZXcgb24gdGhpcyBwcm9jZWR1cmUuIEFyZSB5b3UgcmVmZXJyaW5nIHRvIHJlYmFzZSB0
aGlzDQo+IHBhdGNoIHNlcmllcyB0byBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbmV4dC9saW51eC0NCj4gbmV4dC5naXQNCj4gPDUuMTctcmMxIHRhZz4/DQo+
IA0KPiBSZWdhcmRzLA0KPiBBbGV4IFNpZXJyYQ0KPiANCj4gQWxleCBEZXVjaGVyLA0KPiBKdXN0
IGEgcXVpY2sgaGVhZHMgdXAuIFRoaXMgcGF0Y2ggc2VyaWVzIGNvbnRhaW5zIGNoYW5nZXMgdG8g
dGhlIGFtZGdwdQ0KPiBkcml2ZXIgd2hpY2ggd2UncmUgcGxhbm5pbmcgdG8gbWVyZ2UgdGhyb3Vn
aCBBbmRyZXcncyB0cmVlLCBJZiB0aGF0J3Mgb2sgd2l0aA0KPiB5b3UuDQoNCk5vIHByb2JsZW0u
DQoNClRoYW5rcyENCg0KQWxleA0KDQo+IA0KPiBSZWdhcmRzLA0KPiBBbGV4IFNpZXJyYQ0KPiAN
Cj4gT24gMS8yNy8yMDIyIDQ6MzIgUE0sIEFuZHJldyBNb3J0b24gd3JvdGU6DQo+ID4gT24gV2Vk
LCAyNiBKYW4gMjAyMiAyMTowOTozOSAtMDYwMCBBbGV4IFNpZXJyYSA8YWxleC5zaWVycmFAYW1k
LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPj4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBN
RU1PUllfREVWSUNFX0NPSEVSRU5ULCBhIHR5cGUgb2YNCj4gbWVtb3J5DQo+ID4+IG93bmVkIGJ5
IGEgZGV2aWNlIHRoYXQgY2FuIGJlIG1hcHBlZCBpbnRvIENQVSBwYWdlIHRhYmxlcyBsaWtlDQo+
ID4+IE1FTU9SWV9ERVZJQ0VfR0VORVJJQyBhbmQgY2FuIGFsc28gYmUgbWlncmF0ZWQgbGlrZQ0K
PiA+PiBNRU1PUllfREVWSUNFX1BSSVZBVEUuDQo+ID4gU29tZSBtb3JlIHJldmlld2VyIGlucHV0
IGFwcGVhcnMgdG8gYmUgZGVzaXJhYmxlIGhlcmUuDQo+ID4NCj4gPiBJIHdhcyBnb2luZyB0byB0
ZW50YXRpdmVseSBhZGQgaXQgdG8gLW1tIGFuZCAtbmV4dCwgYnV0IHByb2JsZW1zLg0KPiA+IDUu
MTctcmMxJ3MgbW0vbWlncmF0ZS5jOm1pZ3JhdGVfdm1hX2NoZWNrX3BhZ2UoKSBpcyByYXRoZXIg
ZGlmZmVyZW50DQo+ID4gZnJvbSB0aGUgdHJlZSB5b3UgcGF0Y2hlZC4gIFBsZWFzZSByZWRvLCBy
ZWZyZXNoIGFuZCByZXNlbmQ/DQo+ID4NCg==
