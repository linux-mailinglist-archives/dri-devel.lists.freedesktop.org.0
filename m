Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF8389EEB
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 09:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9E96EEBD;
	Thu, 20 May 2021 07:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62A26EEC1;
 Thu, 20 May 2021 07:30:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDII52A9DRfnI01aB4obA74ic3Lu21Ax4/G2CG3bSPA/bi8GMs1NMTsiGDLbNVUDUXb4KaxHJCnkCAQiL9rJF6DqqfFRCOQlnxj3jpKm74xvRRbNrtspcECHWGCbon22Jjf+7w783/JdKhzb8q9WPyglHc8U6oWMeIdpYnCk73XD16leY8YeMjha2lFh1YoJcM31FrRYxqEmnQNHxXI0e2di78PWUEGb3VXk3+05S3leajA7z+OGDJMDa2itT/34BfeEkwFHCpzke6KKBJUZikdsV0balRvoK6RnH+HDPs066KYg1iMnqOpjsE8Vp0IhqGd1A3mEa+ETKdJMcryyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPz1qDPTXjcClMPKgcs9Du0P5lUqAgCQIL8VRnoFm1Q=;
 b=f/dPity9DRN83rJnu2EcgRwmEWtjXMWqf7eXqJ7Mj27o12fumYbPhgaEg3Xp7UUu2fsfgpqXCxLgtgoSSFta0II9w9+zDuQOiYCn0WKi8XwNPXSdw793R9zEBnKRZ3NoC/ISSKakEAOa37xizGdaCHlEctQz/I+PbbRMYsw4lrYb1hYsiu8VUohE2vyEqoRxnzut4Sdv/CPUUD8h88mxsW7t5XqHaVgBwgBvR4Ee4lMfcPepJxLzJmBph8NfROcz5vRed7MSiXOxJObp9+34AAG0YCvDmlupgKT8lXcLW1d/iSe60Us0mkE/nsMJH1mcm041DOSVQSlSPU2yQVTagA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPz1qDPTXjcClMPKgcs9Du0P5lUqAgCQIL8VRnoFm1Q=;
 b=Ytt/293ex1Z5PiC6Jzs5Feul/qFrUCw2Yt9q50nouMalsB7RA/zFQDZkr08/JB9GN72/Yh61BzmTIjj1BHrWRs441uZjMFh1Iry5ntQ2WNJ6A6fnGyvG6apK1s+uwpVP8dXTXbeAQMxt4p1913FFsgqLrovxauGwCGP1Va0CNRI=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23; Thu, 20 May 2021 07:30:06 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d%5]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 07:30:06 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>
Subject: =?utf-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiBbUkZDIFBBVENIIDEvMl0gZHJtL2FtZGdw?=
 =?utf-8?B?dTogRml4IG1lbW9yeSBjb3JydXB0aW9uIGR1ZSB0byBzd2Fwb3V0IGFuZCBz?=
 =?utf-8?Q?wapin?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtSRkMgUEFUQ0ggMS8yXSBkcm0vYW1kZ3B1OiBG?=
 =?utf-8?Q?ix_memory_corruption_due_to_swapout_and_swapin?=
Thread-Index: AQHXTFbLtz1o1HqhjUSdnwL4CAK9UqrqJZKAgAAJANWAABCXdYAAVAmAgAEVm4iAAERBAIAADUrO
Date: Thu, 20 May 2021 07:30:05 +0000
Message-ID: <DM4PR12MB5165F8A482435B03245772DE872A9@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20210519022852.16766-1-xinhui.pan@amd.com>
 <c7f28ef7-c0a1-ff76-2b48-4559a8e0e593@amd.com>
 <BN9PR12MB5163D9CC209C0B9B02CD8A5B872B9@BN9PR12MB5163.namprd12.prod.outlook.com>
 <DM4PR12MB5165E11F06A62127A32E9F0B872B9@DM4PR12MB5165.namprd12.prod.outlook.com>
 <075eaedb-ca07-83fa-7c1f-6b94ae5a4e6e@gmail.com>
 <DM4PR12MB51652009560A0FE2AA93ECD9872A9@DM4PR12MB5165.namprd12.prod.outlook.com>,
 <d8fe3545-2feb-cd71-79be-97287bf96dcb@gmail.com>
In-Reply-To: <d8fe3545-2feb-cd71-79be-97287bf96dcb@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_Enabled=True;
 MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_SetDate=2021-05-20T07:30:05.0101718Z;
 MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_ContentBits=0;
 MSIP_Label_64e4cbe8-b4f6-45dc-bcba-6123dfd2d8bf_Method=Privileged
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [183.192.239.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9aebdfe-dd88-470f-661e-08d91b6116f0
x-ms-traffictypediagnostic: DM4PR12MB5136:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB51361130C8C049AEE0C341F9872A9@DM4PR12MB5136.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:308;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vKS7gVS+0+LUgOvhhmDdF9o5+BnPLkydYkEoVEPjR0lckm0AbwQ7B0/HuL3zKNsvkKxiDJ7XBtppWFLldXeutUy5F7yw/suPQnk8jJd56BlT85dchmZRj/81E+f0Q6adJw5MHKL3LctF29zLfBFaj3MzqswoMIum0AK2OvC8r6KeE+Idwy5x/WPvxSE5vLYMtbK3NRgf3Dfodq8tZwL62yX+Y9nMwUkG7Fw5EBWgFlp2meyui6FEz0aQltPISCzLu1dhCk5T/sE8uDgcG1uQh8n2pjrsoLBM1wguuUbwg4kPm5p1qgPOARrNbXVtzuF2FryocuzVjfAHj0JFj9Zd+lUiMvmzrq5BFPNgab/711tUR3bYWBNkgDYhfCaxI3Mp5nAgCtf+N+dvJ5WrcElvBLnDakve3si+gtdzF+YSafO45ng3wxiC6Zevr61pROm3gx4ex7GNl8WFDXtVxtm7VeIjDNuSBwTTU4hsJNHFUacwsX4LNnHGinFQhyN4WovV3WATV2w+HWOaNdeHL+FAncthPYTOAFSuwp7noMYA6vbIf1yvpuqOAg90gUQKrCbGqZtbDnG6r+0WsvC4E87zow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(76116006)(91956017)(66556008)(66476007)(64756008)(2906002)(33656002)(122000001)(66946007)(66446008)(38100700002)(52536014)(86362001)(5660300002)(4326008)(558084003)(7696005)(9686003)(186003)(316002)(478600001)(8936002)(55016002)(26005)(71200400001)(224303003)(54906003)(110136005)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZlJzenJXTVdJQVFKbmZTbUF5Z3JWdzVMd25lajROUktMZ2FqSmdybllpMGxu?=
 =?utf-8?B?N0dkSi95V3ZvdVdMbFVBSjlPbkFPc2hrWjF3WDU3TVMvVkt6TjV6bm9XSnB0?=
 =?utf-8?B?bDZUaitJdWRjd2JodjZJaEtIQ05wS1lFSDdza0lSSVFYS3RWb1QxaGJMYU14?=
 =?utf-8?B?b3pkRU8vcjFZNmpGQytobzBwZXh1UXIwV2kyRld2dEZiTHQzRUI4a1ZiYmJw?=
 =?utf-8?B?RGRuc0J1RTdjTE5OSWc3eTVCekVkNm9rS05WYU1Ubk1TMXFXY0JnK3pjY29s?=
 =?utf-8?B?dnJHcmxkZitDMFJvNTE2ajFQMTgzYjBwNVIyRjZmQkdqeUk0UjZhZkdkWjg2?=
 =?utf-8?B?WTRQN0krelQvL08zL0NPY1VxZ2l3TmRUWHZObTZod3RUSEUzakRXdHh5SzRD?=
 =?utf-8?B?VWdxcWtFd1hxQ0Vta2M1SHltN2hCYkphOFNYbmwyYjdyTW9lMTkrV21QRjVG?=
 =?utf-8?B?K1diR2o3V1ZGOExaL2oxeCs1RXYyUzVueVZoSm9HZlc0YU80bmRTeHlEYVh1?=
 =?utf-8?B?a1ptTC9xS0s0MjVJbDcwamtKMzdnR3dBU0IrZWQ1VWxIRXMzQUIvVnkzWTdO?=
 =?utf-8?B?YTd5cG9mWmZoU2pNWFA4N1pFWHJIRk9DUmpHektQV2Y5aEFMYnJqU25sTEtB?=
 =?utf-8?B?cmVNK2lWY0JMWGxFMUJ2YU1xMkdTWXNML1pHUHhzeHdjUEVDNTlKelVLNU53?=
 =?utf-8?B?ZWlyakxPUkZxNmJFTTJkWWMvZGlCYU9Ydm1WbGdwaE56S2t5ZCtwK2oxTU5R?=
 =?utf-8?B?R1AxMUpkU1ZxdkFzWlVnN1kzdGFwNTVqU2xka2RjakxnMHVKeElZWTNYaVcr?=
 =?utf-8?B?cmZmRHdaUTBmeFZ4TDFES0Q2UkxiZVZpL2F2WGFIVWxPMWJvck5taWtQNWdL?=
 =?utf-8?B?blQ0VzVSNlRRanBQWmdpcUpoOVFOWTBLTmpWSUJpQ0JHOHAxaHpvRGI5WjNP?=
 =?utf-8?B?bWNMeWx3aG93a2xzMmN5RElDTjJROUg0bjY4SkRiNDd6WXZocG5NeC9rUElW?=
 =?utf-8?B?eGxhbGc1NmlMZ0Z4eFVWTE1uOWVBMm5iZHY3NVpuSnd5aTNpN1JITXdVZWkx?=
 =?utf-8?B?NldLWG5abEJhalUwV1RpR1NCL2xZcDhHcTRWSGdHdjNlNEhTWVp0VEpuSW52?=
 =?utf-8?B?ZEVXUzVCYUljNWRnQ0YwTHJqZVhQcmx6V1JadWJ6aTVzL0VTSW1DcVFTQWFv?=
 =?utf-8?B?MHRBTDRQUGRyNUdSTm9yRjczOTljWE0xd3VRSDFrak9GTWR0NlZxVWI5ZTRM?=
 =?utf-8?B?dkVvMzFvQXdTVkhIclpaell1d2ZWVks2Ri9yUXZEOVFyZ1lNK25JYnlueXUy?=
 =?utf-8?B?WVFwSXpCMGIrVUMvRTRraVJLUnFKL1RqY2dNMXloMUgxaFRmS0ZZWkNnUkRF?=
 =?utf-8?B?QXhhWTAvRGNiQ0NSSnBxMlB5MHZTalBmamduU1lWZVdSb055WnB4SWJWWXpq?=
 =?utf-8?B?WFEzKzJ5Qmthd3poNlYwVjVWZTlvQm1kKzdXRjErVjh4dUlqV1dEQjkvMy9E?=
 =?utf-8?B?SWNpTHFJQUh0eHV0SisrK2RQejFrbDFQS0poeFZjc3A2VCtJdGZGRCtTa2Rw?=
 =?utf-8?B?Wkp4UGhsZ2ZZalhYdS9mZHpCb3VuNXBVRkxNTzJjYWZkcjgxVW8xT2xkWGFT?=
 =?utf-8?B?eWh2KzNwUFFyK1RLRSs0N05Za3MraEUwTVJ5djhSYzQ5ZXNkKy8yVG13STlj?=
 =?utf-8?B?UXhQTW5zLy9Yd1RtQ0dWM0lpbnBaRkw2d3UxL2plLzFEVWdJeGphWkVVZVR0?=
 =?utf-8?B?eVl4cDFSZE9qVUdSdDF4ZkJQcVlqZGF2OXB3OTZHM29kRDlteUxnT2x1dW0x?=
 =?utf-8?B?YVJZTzFIellpT1JaYmpGdz09?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB5165F8A482435B03245772DE872A9DM4PR12MB5165namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9aebdfe-dd88-470f-661e-08d91b6116f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 07:30:05.8982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: suBxpxxtoRb+d031VGyURbh5gwAwOEG7tkTXiQR9q9LDEMRwDoQP+kh3hAvQCh3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5136
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_DM4PR12MB5165F8A482435B03245772DE872A9DM4PR12MB5165namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBqdXN0IHNlbnQgb3V0IHBhdGNoIGJlbG93IHllc3RlcmRheS4gIHN3YXBwaW5nIHVucG9wdWxh
dGVkIGJvIGlzIHVzZWxlc3MgaW5kZWVkLg0KDQpbUkZDIFBBVENIIDIvMl0gZHJtL3R0bTogc2tp
cCBzd2Fwb3V0IHdoZW4gdHRtIGhhcyBubyBiYWNrZW5kIHBhZ2UuDQo=

--_000_DM4PR12MB5165F8A482435B03245772DE872A9DM4PR12MB5165namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iIHN0eWxlPSJkaXJlY3Rpb246IGx0cjsgbWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgZm9u
dC1mYW1pbHk6IHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsgY29sb3I6IGJsYWNrOyB0ZXh0
LWFsaWduOiBsZWZ0OyI+DQpJIGp1c3Qgc2VudCBvdXQgcGF0Y2ggYmVsb3cgeWVzdGVyZGF5LiZu
YnNwOyBzd2FwcGluZyB1bnBvcHVsYXRlZCBibyBpcyB1c2VsZXNzIGluZGVlZC48YnI+DQo8L2Rp
dj4NCjxkaXYgZGlyPSJhdXRvIiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7IG1hcmdpbjogMDsgcGFk
ZGluZzogMDsgZm9udC1mYW1pbHk6IHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsgY29sb3I6
IGJsYWNrOyAiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImRpcmVjdGlv
bjogbHRyOyBtYXJnaW46IDA7IHBhZGRpbmc6IDA7IGZvbnQtZmFtaWx5OiBzYW5zLXNlcmlmOyBm
b250LXNpemU6IDExcHQ7IGNvbG9yOiBibGFjazsgIj4NCltSRkMgUEFUQ0ggMi8yXSBkcm0vdHRt
OiBza2lwIHN3YXBvdXQgd2hlbiB0dG0gaGFzIG5vIGJhY2tlbmQgcGFnZS48L2Rpdj4NCjwvYm9k
eT4NCjwvaHRtbD4NCg==

--_000_DM4PR12MB5165F8A482435B03245772DE872A9DM4PR12MB5165namp_--
