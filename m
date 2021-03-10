Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4AD334B27
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 23:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF01D89D7F;
	Wed, 10 Mar 2021 22:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3E389D7F;
 Wed, 10 Mar 2021 22:12:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSFpq1UB3fXY51xSlhpb3OcP3QTaCtIUrtmTkih3NFcIIFj/QnrckjNNOqxYi8Rki0SlmoKkZiJcYsXvZUPIa6uyw4CPDjLKB59Y6OFDyTahJsSvh8Yurd/K40oR4r147gT6GqABFN/REtSl9mQeEhrx2u+bj9igu8t4Xn2GgGkdgWrU/s+TZ4RrNf0grsWOms1bIKE8LQRotN/owyL0PRLs9OsiDQNgv1hjmsYdKuXkvXE8aU77IQBzDle5CV4Rb4IkmklbrXfcaOZdp5kELHh7rSRAc0//1HISfSyyyUHgLUpT2jArqOVAnaFgQzSot+RkXDBfzH7e9e4TGtYDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgxShGdghfOnUTFIUgW1AdIGZvBh0X/FqW3o5N41NOs=;
 b=TKjj/CARlIW9DxqZQpWZFeHVxBDvb10TGNuwc8Qv7rQ5i2r4Ud2k1FpRbc5573olPEaVV/vv01REM5kMXJTFMre/oncb5sfSRCrhcAb64ue9H3Rqmgv9j73RcPcYqHDf0xmJDhVBzAPv4tD2xiuJ954RJqWXYVlIY5S+5C2xlyFJ32cMB+3nR//Fmx4oXk3ucbdOpBXt+SuoazUemARfNyuUQoVKM6vG6zgZnQ5y4/Q0SuO/q1pSHBcGzyNq1OGdzBTrwUCKjl8ZeR5NYp6mSA+LxUZkBBYn6ufRsBRxmM9GiLtht3m+OCDQdgh8b3FaLKNGNyt8syuWrfnswtEc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgxShGdghfOnUTFIUgW1AdIGZvBh0X/FqW3o5N41NOs=;
 b=hyR/D4BOgPa13W10DxgmCWYDBKVlZFiSaDc+VmbbF4trZy/0CMdUc8auhyXw2hmjWkv8zAxk6sFGlYEbrl4UGcxCQgyxd/u03qQISKpSFX+eSRkhIXDumH03ZXElKdSS8H5pMpZTY4Fih/Al3CuCm4lsmBE3XL6rhVUSmTFQSZc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 22:12:02 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::5deb:dba7:1bd4:f39c]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::5deb:dba7:1bd4:f39c%4]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 22:12:02 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, radeon drm-fixes-5.12
Date: Wed, 10 Mar 2021 17:11:41 -0500
Message-Id: <20210310221141.3974-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [192.161.79.247]
X-ClientProxiedBy: BL1PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::25) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.247) by
 BL1PR13CA0170.namprd13.prod.outlook.com (2603:10b6:208:2bd::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.23 via Frontend
 Transport; Wed, 10 Mar 2021 22:12:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 15a09086-98ab-498b-15f0-08d8e41187b3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3872:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB38723A2AFF460ACB8550730AF7919@MN2PR12MB3872.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8LncXfCPV5x8iJCV4OGBV7Cn9WvMVxG+E2V7JLf1Ky6LTHTxn3eIQPZHWqbtXXrvP95wbwoP8i23tAheHLDuUPCrrIkIxQRb2s/jJfJx4Dm2+9BMoJNPvJsrhKPjRGoo7Ns/HS7w7TEXmKgDX+57/lM3Advamh5+7P9BQ7fs7sVotkyq3ZodQVxwsACtkK8a+yqKk0nv2evb2IAiQW5+HfVcDI7QzOSB9F4PJzGwiuhqvVs23pNtYAZfu+7xFA3sBnRdSfkQ7jm6Ur3xQXsPbYBeBM++Y02VqUXAfX91RODSALpOejKGHEK0EE7uYtHnbErn+UZ3TIEsNKSo4rB4Dkr2W7gAd1t86TA2opx7zrkr6ZFNx3ZjXla3I+S6I56O/mN+KEw8wfmhvNBGYRKD7M1s/TV4cYIUzw53MqFBtTWXAdXghZBJShHUWfjgdxK5I2RU7jlSmJMNCwky8zntB2krBpFTh3hQmqcargdBCrFPdeun+iRYMibGorq/XWm3PlyBAsOWM3ro60TpG5KN78GwRtxKqUQ7qjCp4/LoNKUvVfS/0N0lF3XbxIuuO0Wn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(6506007)(478600001)(5660300002)(4326008)(8676002)(16526019)(956004)(66556008)(6486002)(66946007)(6512007)(2906002)(2616005)(186003)(36756003)(1076003)(26005)(66574015)(86362001)(52116002)(6666004)(66476007)(83380400001)(966005)(316002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WkNqdnEwOWhPWTFGVERYeGwxK3ZzUWpLTTU3cmlPRGR3d0E0K2dSMERZV0Vo?=
 =?utf-8?B?TTFiWHFCWFMrMU9pQ0xQTmJGRnl0UGF4SW5HMGd4b3B2ZkpMSmdWUHQ0ZEhL?=
 =?utf-8?B?aldkTWpGdzNHWHJUQmtSWDQraDZxN1RhWk16K1BDLzlyemlKN1k2MVBKTkF2?=
 =?utf-8?B?a3R5TTlLT3ZnS21GcFFSaERvZEtNRGlCMFVMWVo0dUNIKy9ISWp0ZFdGNWYw?=
 =?utf-8?B?c1gvWnpZZWZqNGxCSk84bXpWeVZMRWRLQ1FEVWx0RThjSXo5OVN1UjJLZWwy?=
 =?utf-8?B?Y1VXM0xweWJYdXFmQkszRlI0bXJsMitwWjF0SDd0aXd2ckovb1krcGhlaFJV?=
 =?utf-8?B?VjNYaVRnZVhWam9Ga3FLYVBHTlU4bTFkbVhFTDM3azRUajZvVUZyNkJxN0ti?=
 =?utf-8?B?cWpaRUVEa0FDNEp6eVhZb0I1WlNyam5WNk14QXMyQUdwdzlqUHlCWXpLdzRj?=
 =?utf-8?B?Sm1XWGJVWm5ocGhyUS9zR2NRYjUrUVdBT1FYdFlveWhVYUc5eUs1dWh4aFoy?=
 =?utf-8?B?eGVJK1o2L3dVNEFmelZocFhEdEY2aGVlZVpBZDltcnZ3SHI2SGZPQWNyZmIw?=
 =?utf-8?B?Z1VmVlR0dFVxeEZzVkhMSmh1QmhBcVk5SWJFMVU4ZzRsZlh3MFFrN00vMEky?=
 =?utf-8?B?YUNtQWtjWGY5VW13ZG9WR3hrRklyY3BJL1JpWG0yS2lOTzlsWjVqT2JuNzFV?=
 =?utf-8?B?RUgrNEpPQWh5TjdmNDJ6V1g4RTNtVVgyVUR0OXNTcVBmeXh1ZEZIVlpWZDdM?=
 =?utf-8?B?UzYxZWQ4NGQ3cFlEODhoUmhoY0lIMllOZnpXYXM0ZTVIOERzOTI0SHNkMmM0?=
 =?utf-8?B?UGVMMWxSZDdTMUZpVGJTS0s5TGttMXdhTGptMXl6UGQwam5oSlFWeVFDR29V?=
 =?utf-8?B?YU1UMzRSdzVlbXEzUHAvL051U0xRWm4xUWVBb0c3emdscTVaZ2JWWFF5MzRV?=
 =?utf-8?B?SnNqc291MTRDUmJkMDc0WUdNWlpFcXZXK1V3K2NGTk1yQXlZTFNxVTkweGF5?=
 =?utf-8?B?VHFkNXRUL3IxUTI0cENWRnNTdkxoSk9vaW83aWlORS9Qa1BneUVpWTFIclZ0?=
 =?utf-8?B?a01iZ1hhTmVnUTZlbVpGVzBjK2RJUER4L212RmRzelg2cC9oWFRhZjV6SjI3?=
 =?utf-8?B?Kzd5QS85SXVpVUg1Q3A1enlxRHZMZDVJVjhidkYzU3hJd21WdXljQW9KTjlP?=
 =?utf-8?B?N0VaV0xpeDhGd0lpWUg5VlNVVGc0VXplUFk5UTViZzIydWJlSW0yVjRtYm0z?=
 =?utf-8?B?dzEvUElZUjhTZFdkYlk3M2lGektWcFVFaFhTWSt1cFJUNExFZERsYVdIaEho?=
 =?utf-8?B?TWNOeGFmSmdsVEk5TGVFRDB4S21NN25nNU1raEVaczJndTU0eGNkTTJWeWRP?=
 =?utf-8?B?aXRabUJiRStjbnBJUnRxNzh0MGd3bGJOWU5uU1QrZjIydTRQUC8rR2JOUjNZ?=
 =?utf-8?B?VTkvejYrQ1EwcU9JRjNTM1RnVWhHSStiU1loNys4QzNoTXBaUTgvVmhXdUtL?=
 =?utf-8?B?NGZia0lDNW9yOXR0eHBnWnFYaURscGR3QTJ4bGMvV3NJZmoweUdGTklxMzIr?=
 =?utf-8?B?WFhKWGJMZkVHTkZrNlRwTHlWRXdlRGdBbDE5aDl2MEdrcEdWVUtnSjlqaFVq?=
 =?utf-8?B?TmV6TUhOb0xlRWhNYUE3ZHA2bTRjRms2ajEvaHlmU0tZUkoyZFhvRDVEalhH?=
 =?utf-8?B?UWIwOGtFRzdkRDh0ejVkaVpWQjl5NEYrWjAyNndlbmd2M2JyYXh0d3c5MTNq?=
 =?utf-8?Q?AThFzebh/fgAf1g8QkgkcW2oR7jHwsi34xRABJa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a09086-98ab-498b-15f0-08d8e41187b3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 22:12:01.9314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZginfifMwul4OSGnWfwUby16dWrOTR9d+/OJJcCBetN3UrnBBm5t7jfPfPPwdHkfl40lDOvSd/2VzwMKNWSt+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3872
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuMTIuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMg
c2luY2UgY29tbWl0IDFhYTQ2OTAxZWU1MWMxYzU3NzliM2IyMzllYTAzNzRhNTBjNmQ5ZmY6Cgog
IGRybS9hbWRncHU6IGZpeCBwYXJhbWV0ZXIgZXJyb3Igb2YgUlJFRzMyX1BDSUUoKSBpbiBhbWRn
cHVfcmVnc19wY2llICgyMDIxLTAzLTAzIDIzOjA1OjE2IC0wNTAwKQoKYXJlIGF2YWlsYWJsZSBp
biB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9hZ2Q1Zi9saW51eC5naXQgdGFncy9hbWQtZHJtLWZpeGVzLTUuMTItMjAyMS0wMy0xMAoKZm9y
IHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGE1Y2IzYzFhMzYzNzZjMjVjZDI1ZmQzZTk5OTE4
ZGM0OGFjNDIwYmI6CgogIGRybS9hbWRncHU6IGZpeCBTMGl4IGhhbmRsaW5nIHdoZW4gdGhlIENP
TkZJR19BTURfUE1DPW0gKDIwMjEtMDMtMTAgMTY6MjM6MjYgLTA1MDApCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmFtZC1k
cm0tZml4ZXMtNS4xMi0yMDIxLTAzLTEwOgoKYW1kZ3B1OgotIEZpeCBhdXggYmFja2xpZ2h0IGNv
bnRyb2wKLSBBZGQgYSBiYWNrbGlnaHQgb3ZlcnJpZGUgcGFyYW1ldGVyCi0gVmFyaW91cyBkaXNw
bGF5IGZpeGVzCi0gUENJZSBEUE0gZml4IGZvciB2ZWdhCi0gUG9sYXJpcyB3YXRlcm1hcmsgZml4
ZXMKLSBBZGRpdGlvbmFsIFMwaXggZml4CgpyYWRlb246Ci0gRml4IEdFTSByZWdyZXNzaW9uCi0g
Rml4IEFHUCBkZXBlbmRlbmN5IGhhbmRsaW5nCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFsZXggRGV1Y2hlciAoNCk6CiAg
ICAgIGRybS9hbWRncHUvZGlzcGxheTogc2ltcGxpZnkgYmFja2xpZ2h0IHNldHRpbmcKICAgICAg
ZHJtL2FtZGdwdS9kaXNwbGF5OiBkb24ndCBhc3NlcnQgaW4gc2V0IGJhY2tsaWdodCBmdW5jdGlv
bgogICAgICBkcm0vYW1kZ3B1L2Rpc3BsYXk6IGhhbmRsZSBhdXggYmFja2xpZ2h0IGluIGJhY2ts
aWdodF9nZXRfYnJpZ2h0bmVzcwogICAgICBkcm0vYW1kZ3B1OiBmaXggUzBpeCBoYW5kbGluZyB3
aGVuIHRoZSBDT05GSUdfQU1EX1BNQz1tCgpDaHJpc3RpYW4gS8O2bmlnICgyKToKICAgICAgZHJt
L3JhZGVvbjogYWxzbyBpbml0IEdFTSBmdW5jcyBpbiByYWRlb25fZ2VtX3ByaW1lX2ltcG9ydF9z
Z190YWJsZQogICAgICBkcm0vcmFkZW9uOiBmaXggQUdQIGRlcGVuZGVuY3kKCkRpbGxvbiBWYXJv
bmUgKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IEVuYWJsZWQgcGlwZSBoYXJ2ZXN0aW5nIGlu
IGRjbjMwCgpFdmFuIFF1YW4gKDEpOgogICAgICBkcm0vYW1kL3BtOiBjb3JyZWN0IHRoZSB3YXRl
cm1hcmsgc2V0dGluZ3MgZm9yIFBvbGFyaXMKCkhvbGdlciBIb2Zmc3TDpHR0ZSAoMik6CiAgICAg
IGRybS9hbWQvZGlzcGxheTogRml4IG5lc3RlZCBGUFUgY29udGV4dCBpbiBkY24yMV92YWxpZGF0
ZV9iYW5kd2lkdGgoKQogICAgICBkcm0vYW1kZ3B1L2Rpc3BsYXk6IHVzZSBHRlBfQVRPTUlDIGlu
IGRjbjIxX3ZhbGlkYXRlX2JhbmR3aWR0aF9mcCgpCgpLZW5uZXRoIEZlbmcgKDEpOgogICAgICBk
cm0vYW1kL3BtOiBidWcgZml4IGZvciBwY2llIGRwbQoKTmlybW95IERhcyAoMSk6CiAgICAgIGRy
bS9hbWRncHU6IGZiIEJPIHNob3VsZCBiZSB0dG1fYm9fdHlwZV9kZXZpY2UKClFpbmdxaW5nIFpo
dW8gKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IEVuYWJsZSBwZmxpcCBpbnRlcnJ1cHQgdXBv
biBwaXBlIGVuYWJsZQoKU3VuZyBMZWUgKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IFJldmVy
dCBkcmFtX2Nsb2NrX2NoYW5nZV9sYXRlbmN5IGZvciBEQ04yLjEKClRha2FzaGkgSXdhaSAoMSk6
CiAgICAgIGRybS9hbWQvZGlzcGxheTogQWRkIGEgYmFja2xpZ2h0IG1vZHVsZSBvcHRpb24KClpo
YW4gTGl1ICgxKToKICAgICAgZHJtL2FtZGdwdS9kaXNwbGF5OiBVc2Ugd21fdGFibGUuZW50cmll
cyBmb3IgZGNuMzAxIGNhbGN1bGF0ZV93bQoKIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmggICAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYWNwaS5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMgICAgICAgICAgICB8ICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9mYi5jICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgIHwgNTAgKysrKysrLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyAgICAgIHwgIDEgLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICAgICAgICAgICAgfCAgMSArCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5jICB8IDExICsr
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YnAuaCAgfCAg
NiArKwogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyAg
fCAgNyArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YnAu
YyAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdz
ZXEuYyB8ICA2ICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFf
aHVicC5jICB8ICAxICsKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jl
c291cmNlLmMgIHwgIDggKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24zMC9k
Y24zMF9odWJwLmMgIHwgIDEgKwogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMzAvZGNu
MzBfcmVzb3VyY2UuYyAgfCAzMSArKysrKysrCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjMw
MS9kY24zMDFfcmVzb3VyY2UuYyAgICB8IDk2ICsrKysrKysrKysrKysrKysrKysrKy0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvaHVicC5oICAgICAgIHwgIDIgKwogLi4u
L2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMgICAgfCAgOCArLQog
Li4uL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyAgfCA0OCAr
KysrKysrKysrKwogLi4uL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdt
Z3IuYyAgfCA2NiArKysrKysrKysrKysrKysKIC4uLi9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkv
aHdtZ3IvdmVnYTIwX2h3bWdyLmMgIHwgNDggKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uLmggICAgICAgICAgICAgICAgICAgIHwgIDIgKwogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZ2VtLmMgICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fcHJpbWUuYyAgICAgICAgICAgICAgfCAgMiArCiAyNiBmaWxlcyBj
aGFuZ2VkLCAzNTMgaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
