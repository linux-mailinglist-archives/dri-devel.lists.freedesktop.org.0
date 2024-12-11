Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129559ED10A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8536110EBA2;
	Wed, 11 Dec 2024 16:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="31Bw3NMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B7110EBA1;
 Wed, 11 Dec 2024 16:14:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubIszFd3vn6MQDWqPW8LTZBFXmENDKLf+KvddDIzWenbYMS4WwGOK77abAyMQZ8C7/VvTTgCbllCRLLTY2BNTOgTKwTk2b3hHvoSIhR6OVgz2hv+j5JnIuqlb1JuBg643ZnYM/4ZcMpdiGsP560Goup6krkTtjVO1C+tgm0NRgm7iL9kgEnYcjovcMlXKm/oJ2b0oh4zhpf71tZoHX9/MLfbKlxK9b42jqwyQQgLhEQvaGKElcWMOUKnjv4e9K6BhNRUQIVlBrEvg1/ljpTPKfymfDkN93KvDh6yJILGUs/rnL6GADDoVV++CjjrrVBQMUhfc28cMaYxdlHABgQGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jot1xs6+M5bQ06l0CS7hcKFI+wXvXXf96RpRG9D2YGU=;
 b=fIZbDa0SWJ80qbQw460jagYy0XxFTn86SPuV8G9Np/6wts6n9gMDyBJi1sOLj0MQE5SvE9Uh/eXJ8I+lwDYt1omyK1QoFH9Nm6hhL883yVUV76Idyfdhb/6LcGKimxtwhAKTz7FqzhS85BAFmIkB62wF1a9ufQcJOU6+C5eVavKhaEIAvbFP9hlnYq946TfouYhWtf2OcOyy+dLAVa3SROihBbICiqqIUVVZCQLemX+1f+upJuAiUqbLSg8mkWnzfJu6/3lLDHV6nvvwKxyhBiaypjeElwjRQAm3Cd76EqcCPHYxiu4y380J4bwuvOOECihOn1U9cqY3MyNWZWG9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jot1xs6+M5bQ06l0CS7hcKFI+wXvXXf96RpRG9D2YGU=;
 b=31Bw3NMohz0muEL8UdCfJPs0mq83fI4izksdjgF0eyfPgd9Lz4LrtltgGKqv5rt7eIPhvaDBNTK1huToB/2CwpPhQhOQem+cTaUkfvto+7ZdY7Phmx5+fSvlR4bdsh+n75/CWURxhcAgynnB9/CgxaXbWqmP91UXSocn9ANE5Jg=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.16; Wed, 11 Dec 2024 16:14:53 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 16:14:53 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v10 4/6] drm: consider GEM object shared when it is
 exported
Thread-Topic: [PATCH v10 4/6] drm: consider GEM object shared when it is
 exported
Thread-Index: AQHbSy1d2oBDuua+lUe3Pyt6olRLiLLgs3MAgABeW/CAABNdgIAAEZEg
Date: Wed, 11 Dec 2024 16:14:53 +0000
Message-ID: <SA1PR12MB8599C134256BC6E17AD66070ED3E2@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20241210175939.2498-1-Yunxiang.Li@amd.com>
 <20241210175939.2498-5-Yunxiang.Li@amd.com>
 <674b6d62-2274-4b0d-8d27-382faad5de88@amd.com>
 <SA1PR12MB859965C4B7EEB4B131E8C7E6ED3E2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <8e514b7b-7826-4870-921a-ab6dac9a65c2@amd.com>
In-Reply-To: <8e514b7b-7826-4870-921a-ab6dac9a65c2@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=4dc88c69-8a1b-4d88-b99f-def2c5b5c4d9;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-12-11T16:10:21Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|DS7PR12MB6262:EE_
x-ms-office365-filtering-correlation-id: ec591703-3d75-4d25-683e-08dd19fef272
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZHRXbU9NUHc2VzcvZDZLSDc3aVdqS1FVSnhQS1JNMGVnVGJCbzJSWjRtK3E3?=
 =?utf-8?B?ZFp0U0Z1bVVmTXRTbUVaVnVwdHZmM2UvVjVIRmg4aXprZUdrVjlrcHJGNEtr?=
 =?utf-8?B?V1doR21YYmRHbitTLzJjdkVQalBHZVpQcnMyMUdpd1NLNkJmV0NIelorY1dS?=
 =?utf-8?B?Qk16RVVyb2ZnSGpTbjdpQXVUVWtMS2R6WDRXMWNRNTNxSnZYUGZ4WHFlTVdN?=
 =?utf-8?B?TUV1WkJPK1Rlek9MWkFaY0toVkl4TkxBT2pFYTVGRXdpd0FDMDN2dEgrRE1C?=
 =?utf-8?B?d0hpQnJtLzNBOGtjMG9tSVVzTTFxN3VKa3dMNHhETFhQdncxY0QzQ1M5elR1?=
 =?utf-8?B?RWlxbGZ5OTNpeU5DTTFnczlRVlhiVENFYkNkMW5Kb2RDNXRudllDSGdQRkNO?=
 =?utf-8?B?Ui84NUVvR1oxOElaSDBqK0xkdzBvNkxUQXplUXZkdHRickFhNXdkSFd0dHU1?=
 =?utf-8?B?R1BEdjNhOS91Q0Y0Q2hya01XNjBMczZZK0UyY21QOTZZZ2lyTXVRSmRMbWtQ?=
 =?utf-8?B?M0dYTzEvOTBzOFNyR1B6bENIQ2IyZUMyRHpwRXBmTmtSUWlQR3d1YjYrWTNk?=
 =?utf-8?B?TVpaNnI5a3dhRWpGcFpIMmxRcGJJcTlaSHlNRWw1dEdSM2xINUZVTFV3WjFt?=
 =?utf-8?B?MittR2RwajhCMWlrcitOa3NoUzNnZS9hdUlLRTRDakh2MkMwNFV6VXFEN1Fp?=
 =?utf-8?B?NFphTHhYYStLcDAyakMwbzlmaTFYTzA0dUgyL3VETmZsdGdNbXl2bFd5T29k?=
 =?utf-8?B?amliMloyY2NlQnBwY0dRcTVRZytLMEZZYUtZU1dpeGF3Yzh4MSs3cVRBZzhw?=
 =?utf-8?B?Wms3Rlg5QW8ydzRSdUhsU2JFQ0RwR2dCQURGTmg2bFZsYlR1bGtBS25Wa2lX?=
 =?utf-8?B?K0szRDRnZXMzUnYyUGtoSFBFSG5XSFVkbW85UkFVQzlNNXhwb1hrN2ZwWWE0?=
 =?utf-8?B?d1JzSWFWRDhpQ3I2ZjlBc3pBV0tsbTBOVTVIMjFQa1B1bEp1cHBIV0t1V3Ev?=
 =?utf-8?B?TGFKRTRSV3pXZDF6UEVHcHNoRTUvWmdqWkp3dGdySWw4T1FHQzRxZzBWS0lQ?=
 =?utf-8?B?LzhsQnFOVHRsengxQkZoSWk3YlFYOW5ZUmxqN3pvb2dDNWVkYzZ0T3VySTBQ?=
 =?utf-8?B?MURBdjJDYWlzanZrZFRVU1k4UWsrWFRZNmczenVWcmdreHA3Qm9sM3h4R1pN?=
 =?utf-8?B?dDh4VGxybTcwclkxR1RmOWF4Nm5aQ3F3OHRLb0hhSHZaa2xzNmEzWkJRSHJU?=
 =?utf-8?B?ai9BSWhMSzBWWXNqT2h0ZWlTMk5Va2tZalBCZU1ZRFVMNDk5ZVVka25mM2tp?=
 =?utf-8?B?My9YSzc4dlU1b3MwaDIvK0lSMjhuelJ6THRMWVF3NnhpblI4eWJtcFkvOGs0?=
 =?utf-8?B?b2lZVlEzcTNKV3pNeVdONVNLeEJ4MDBXZ21MZ3R0ZXpQRkw5S3d0TXViRnZm?=
 =?utf-8?B?b1Bzd0c0RzNBMnl1c1NZNHQ4NXpaODZpVzkwb0tVSFN4aGVJWVBvUmt0NHFY?=
 =?utf-8?B?NzdjK3ZvTjZ3QlN2WW5TRjVCZktHUk9DNVI4SkxkN09lV3JlK2FtSml0KzBV?=
 =?utf-8?B?NGlYMmhTeFlBK3g4akV6T0F0TS9MakNEOGlyNytwdktMMEhJOFZTMDBUckpr?=
 =?utf-8?B?L3JrM3ZHNVJUc2tlMHpjZXQ3SFpGV1VnV3RiMHhKc3JBUVFneHU1ekEvN25u?=
 =?utf-8?B?dEF3c2hWNWlablRoejU4dlFQWHhsc0s4Ly9HYkVvc05Ra0lhT3FDdDVjNjI5?=
 =?utf-8?B?SVNXU0pGR1VVaFpSejNvSDY4QktHdWwyQlhCWlcwRm9IYVUva0F6V09tWVRs?=
 =?utf-8?B?engrdTk5ekk2cndPZWtnRTBtZE1GQUdGTklsZENRbzZ5eDlBdjhvUzI1U1Rr?=
 =?utf-8?B?ZHg5MlNBMmxpL0dhYzExSVVsOGJBRzUwVWpjWWFKbTdIK3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3k2cTRvbEV5RVErNHc0NEZ0MlphU2hrWEIyOHdTckVkeUMySDViQmtyVWJm?=
 =?utf-8?B?MmlXa1dMeUVGMjF4TGpsL2ZFM1hEVk1ldW5qVGdPZFU5aFYrNUw2N0JHTWF0?=
 =?utf-8?B?d2phMmU5V1BJY3MralEwbW5xUkxwQTFyNkpxNVdsVmVOUWFBOXVOeEFocE11?=
 =?utf-8?B?bjJoUk5XdUMzT1hzcmQwd05Rak9JNUNvWHVTenpFWVJ2dktFYU1ibkdVeTJ3?=
 =?utf-8?B?U3kydkU1dWU4aWczZWMxYUJxanE4cHd5OFJPV3dtT1krK1VhZWMwR1cwUWFV?=
 =?utf-8?B?UjN5ZXZaNUg2cEphOWRQalFlRnBWRW40QkRoNnF1R0hld0JOTnYvRkVaTHdH?=
 =?utf-8?B?SDFlNW81aTRPUSt1aVFKMDRGUzhGOUxNZmR5MEdGNU5ucjhyeXBUamdlb2da?=
 =?utf-8?B?Mm54eVNiWGhYS1JSc1pMQ2s2SDkrV0NvT2IxT3V3bkVyUE5yMXZZdGJVZ01J?=
 =?utf-8?B?by9LVzF4S3orNUlTa3prWTVCVE5FRlR6WjI1azZMRFEvTDJObEdIeDJwK0RJ?=
 =?utf-8?B?aEgxK01hZDJEWThMS013bDNYQ2RLaDFuYUYrSHVvOWt5TndzSmdFUFd3Ynhn?=
 =?utf-8?B?d01jU2tFQXZIMkhWajhCb0dKYTQ1eTB2SjgyRHRFZ1BvUkU2ODVRTW5jQlBX?=
 =?utf-8?B?OTRHK3RidGlsanpOTi83enBhYjNWbEpTdDRNSWpNMGtwN0p6TDVjRmFGV3dO?=
 =?utf-8?B?SlpIK3lqOHQ1R240dVp0K1pDWlFlditYVktweG9Od0xVa3FrcitJUFlpaUtH?=
 =?utf-8?B?TEFqNFhFSWdEUEExVEpzUk0yYkNYY1dkeTFZSjgvVVQrUnZDUDNVL2NWb1My?=
 =?utf-8?B?azRaWE9IV3JmWXhtWERMUjM1L3ByV1JaSEhzTGhIbldPMHN0QVprVld0ekxn?=
 =?utf-8?B?N3E3TVVLNHFEeFluQU5IT0h1dmgvVmJ3UTdubm1CSHE5SjZBdlFZNWE1bEQv?=
 =?utf-8?B?SjZkcDYwRXptdElZWm55bVJ1cVpkSkNzS2tlSkR2eU1DRVNOUXRKS0lVSlhU?=
 =?utf-8?B?TFJHZjZQNTBKZFJjcjVERm9YTDd0YUhmOVIwTGtIK2tVYld2MU1SVFcvQTdm?=
 =?utf-8?B?WTJ0RSszazVKbERaZDhpZS96bVBQWWJzTDhGRGFyamFCdWM1UnN4Vm9GWkUw?=
 =?utf-8?B?NDNnN2JWblFZRFhJQnBqVitsNDJoODBFODV3dm5WRUxoREt1UnZ0bHlOVENv?=
 =?utf-8?B?b05jYlkxZkorMndPOW5lT3Q1YW5lbTVQMktnMnNyb3ZDVk1kWjJWUjlyRlpT?=
 =?utf-8?B?NUFyYVRNNG1jQ1BsV1FjTDh2UXFwdE9pRUlqS2tXQWpjTXdqMktUejUyVjZa?=
 =?utf-8?B?SHd2QVhpeTlqRlMyZFhHdjN3MG1Ia3FZc0hCcWtGZGNaQXFmS1V5clFseUhR?=
 =?utf-8?B?QjJpQ21paVpVaXg1TVVoTzA5ZTVzZWUvSnAvdkpQTGZVYXFmSnVsUFlxRE1r?=
 =?utf-8?B?NlpHTXhPS2wvZm1DbUptREF3WjZjMWVFV1pGRVRmNEh5VHFYM3dBNzA4TXdy?=
 =?utf-8?B?YjZKTDRIeU5XRmJwd3BZb0pHd0pSdExiMmlFWnhIN2d5Q0pPZHRzUjc5Yy9W?=
 =?utf-8?B?T0QrRGhuaTcxOTg2b1J2c1VYV3BlUk1oNzlmTFoyb1BqSkNxZ05FR2FGN3dQ?=
 =?utf-8?B?M0NhZGJjZ2llZk4xZHpHa2daamdyVEJmMUdmUE03cnZkNzA0SnZSN01zOHo2?=
 =?utf-8?B?ckpURTcrWFpaQUNMNGZ3bjZaYkJoT0doYlB2cFpEN3g5NmdVTXg0ZGdhMzZQ?=
 =?utf-8?B?TkFQR1NyTXVaWDFTR3pBRnc1WnEwSkt5cFZmOEFGMVpzL1pHU2xnR1Zmb25S?=
 =?utf-8?B?K3R1TEFaR1RMSWlOdHB0OU55aE81ckxVT1o5ZkdKZXB1dHFaV0pGMFJUUXYv?=
 =?utf-8?B?ZmhwMHFDcHM1c2hHNTFjU0dEZTRNN2FtZEIwYmxaOGRUSkxGbGtnempWd3Fh?=
 =?utf-8?B?NkVEeEhSYzJxbDVsekdDaWwxQTZKM3R5bnpCQmQ5VGFmQXBobU56c1BlUjRE?=
 =?utf-8?B?aWEzZjJJOEYwamVMeHc2L0cwSEdpTHBiUW5CVVR4TXhBUzIyVnhDVU91bnhC?=
 =?utf-8?B?RGkvRkNabUZQZXJMZm1OSnpoYXdMRi9hVU82TDNSbitCM0J4aVNNU1VrRi8v?=
 =?utf-8?Q?wTHE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec591703-3d75-4d25-683e-08dd19fef272
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 16:14:53.6194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6OjiKYEg+5y35GEcj2iM4DNFJodOQ/et+SbS6djNXcBZOy2cmot9/8o/zpj2TG08YoRhykDeQx1wJagwNH/jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0Bh
bWQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDExLCAyMDI0IDEwOjAzDQo+IEFt
IDExLjEyLjI0IHVtIDE1OjAyIHNjaHJpZWIgTGksIFl1bnhpYW5nIChUZWRkeSk6DQo+ID4gW1B1
YmxpY10NCj4gPg0KPiA+PiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5p
Z0BhbWQuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDExLCAyMDI0IDM6MTYg
QW0gMTAuMTIuMjQgdW0gMTg6NTkgc2NocmllYg0KPiA+PiBZdW54aWFuZyBMaToNCj4gPj4+IFRy
YWNraW5nIHRoZSBzdGF0ZSBvZiBhIEdFTSBvYmplY3QgZm9yIHNoYXJlZCBzdGF0cyBpcyBxdWl0
ZQ0KPiA+Pj4gZGlmZmljdWx0IHNpbmNlIHRoZSBoYW5kbGVfY291bnQgaXMgbWFuYWdlZCBiZWhp
bmQgZHJpdmVyJ3MgYmFjay4gU28NCj4gPj4+IGluc3RlYWQgY29uc2lkZXJzIEdFTSBvYmplY3Qg
c2hhcmVkIHRoZSBtb21lbnQgaXQgaXMgZXhwb3J0ZWQgd2l0aCBmbGluayBpb2N0bC4NCj4gPj4+
IFRoaXMgbWFrZXMgaXQgd29yayB0aGUgc2FtZSB0byB0aGUgZG1hX2J1ZiBjYXNlLiBBZGQgYSBj
YWxsYmFjayBmb3INCj4gPj4+IGRyaXZlcnMgdG8gZ2V0IG5vdGlmaWVkIHdoZW4gR0VNIG9iamVj
dCBpcyBiZWluZyBzaGFyZWQuDQo+ID4+IEZpcnN0IG9mIGFsbCBHRU0gZmxpbmsgaXMgcHJldHR5
IG11Y2ggZGVwcmVjYXRlZCwgd2Ugb25seSBoYXZlIGl0IGZvcg0KPiA+PiBjb21wYXRpYmlsaXR5
IHJlYXNvbnMuIFNvIHBsZWFzZSBkb24ndCBjaGFuZ2UgYW55dGhpbmcgaGVyZS4NCj4gPj4NCj4g
Pj4gVGhlbiBmbGluayBpcyBub3QgdGhlIG9ubHkgd2F5IHRvIGNyZWF0ZSBtdWx0aXBsZSBoYW5k
bGVzIGZvciBhIEdFTQ0KPiA+PiBvYmplY3QuIFNvIHRoaXMgaGVyZSB3b24ndCBoYW5kbGUgYWxs
IGNhc2VzLg0KPiA+Pg0KPiA+PiBBbmQgZmluYWxseSB3ZSBhbHJlYWR5IGhhdmUgdGhlIC5vcGVu
IGFuZCAuY2xvc2UgY2FsbGJhY2tzLCB3aGljaCBhcmUNCj4gPj4gY2FsbGVkIHdoZW5ldmVyIGEg
aGFuZGxlIGZvciBhIEdFTSBvYmplY3QgaXMgY3JlYXRlZC9kZXN0cm95ZWQuIFNvIGl0DQo+ID4+
IHNob3VsZG4ndCBiZSBuZWNlc3NhcnkgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiA+IEZvciB0aGUg
aW1wb3J0aW5nIFZNIHRoZSBzaGFyZWQgc3RhdHMgaXMgYXV0b21hdGljYWxseSBjb3JyZWN0IGJ5
IG9wZW4gYW5kIGNsb3NlLA0KPiBidXQgZm9yIHRoZSBleHBvcnRpbmcgVk0gd2UgbmVlZCB0byB1
cGRhdGUgdGhlIHNoYXJlZCBzdGF0IHdoZW4gdGhlIGJ1ZmZlciBnZXRzDQo+IHNoYXJlZCwgc2lu
Y2UgaXQgaXMgYWxyZWFkeSBjb3VudGVkIGFzIHByaXZhdGUgdGhlcmUuIEFzIGZhciBhcyBJIGNv
dWxkIGZpbmQsIHNlZW1zDQo+IGxpa2UgZmxpbmsgaW9jdGwgaXMgdGhlIG9ubHkgcGxhY2Ugd2hl
cmUgdGhlIGdsb2JhbCBuYW1lIGlzIGFzc2lnbmVkPyBUaGUgaW1wb3J0aW5nDQo+IHNpZGUgaGF2
ZSBtdWx0aXBsZSBwbGFjZXMgdG8gZ2V0IHRoZSBnbG9iYWwgbmFtZSwgYnV0IHRoZSBleHBvcnRl
ciBhbHdheXMgbmVlZHMgdG8NCj4gZmlyc3QgY2FsbCBmbGluayB0byBhbGxvY2F0ZSB0aGUgbnVt
YmVyIHJpZ2h0PyBTbyBob29raW5nIGludG8gZmxpbmsgYW5kIGRtYS1idWYgc2hvdWxkDQo+IGNv
dmVyIHRoZSBiYXNlcz8NCj4NCj4gSXQncyBpcnJlbGV2YW50IHdoZXJlIHRoZSBnbG9iYWwgbmFt
ZSBpcyBhc3NpZ25lZC4gVGhlIHByb2JsZW0gaXMgdGhhdCB0aGVyZSBhcmUgbW9yZQ0KPiB3YXlz
IHRvIGNyZWF0ZSBhIG5ldyBoYW5kbGUgZm9yIGEgR0VNIG9iamVjdCB0aGFuIGp1c3QgZmxpbmsg
YW5kIERNQS1idWYuDQo+DQo+IEZvciBleGFtcGxlIHlvdSBjYW4ganVzdCBhc2sgYSBmcmFtZWJ1
ZmZlciB0byBnaXZlIHlvdSBhIEdFTSBoYW5kbGUgZm9yIHRoZQ0KPiBjdXJyZW50bHkgZGlzcGxh
eWVkIGJ1ZmZlci4gU2VlIHRoZSBjYWxsIHRvIGRybV9nZW1faGFuZGxlX2NyZWF0ZSgpIGluDQo+
IGRybV9tb2RlX2dldGZiMl9pb2N0bCgpLg0KPg0KPiBXaGVuIHlvdSBtYWtlIHRoaXMgY2hhbmdl
IGhlcmUgdGhlbiB0aG9zZSBHRU0gaGFuZGxlcyBhcmUgbm90IGNvbnNpZGVyZWQNCj4gc2hhcmVk
IGFueSBtb3JlIGV2ZW4gaWYgdGhleSBhcmUgYW5kIHlvdSBzb29uZXIgb3IgbGF0ZXIgcnVuIGlu
dG8gd2FybmluZ3Mgb24gVk0NCj4gZGVzdHJ1Y3Rpb24uDQo+DQo+ID4gSSBjb3VsZCBwcm9iYWJs
eSBtYWtlIGhhbmRsZV9jb3VudCB3b3JrIHNvbWVob3csIGJ1dCBpdCBsb29rcyBsaWtlIGl0J3Mg
cmVhZCBpbiBhDQo+IGxvdCBvZiBwbGFjZXMgd2l0aG91dCBsb2NrcyBzbyBJJ20gbm90IHN1cmUg
aWYgdGhlcmUgd2lsbCBiZSBzb21lIHJhY2UgY29uZGl0aW9ucy4NCj4NCj4gVGhlIGhhbmRsZSBj
b3VudCBpcyBwcm90ZWN0ZWQgYnkgdGhlIG9iamVjdF9uYW1lX2xvY2sgb2YgdGhlIGRldmljZS4g
VGhlDQo+IGRybV9nZW1fb2JqZWN0X2lzX3NoYXJlZF9mb3JfbWVtb3J5X3N0YXRzKCkgZnVuY3Rp
b24gaXMgcHJldHR5IG11Y2ggdGhlIG9ubHkNCj4gY2FzZSB3aGVyZSB3ZSByZWFkIHRoZSB2YWx1
ZSB3aXRob3V0IGhvbGRpbmcgdGhlIGxvY2sgc2luY2UgdGhhdCBpcyB1c2VkIG9ubHkNCj4gb3Bw
b3J0dW5pc3RpY2FsbHkuDQo+DQo+IFdoYXQgeW91IGNvdWxkIGRvIGlzIHRvIGhvb2sgaW50byBh
bWRncHVfZ2VtX29iamVjdF9vcGVuKCkgYW5kDQo+IGFtZGdwdV9nZW1fb2JqZWN0X2Nsb3NlKCks
IGNhbGwNCj4gZHJtX2dlbV9vYmplY3RfaXNfc2hhcmVkX2Zvcl9tZW1vcnlfc3RhdHMoKSBhbmQg
Z28gb3ZlciBhbGwgdGhlIFZNcyB0aGUgQk8NCj4gYmVsb25ncyB0by4gKFNlZSBob3cgYW1kZ3B1
X3ZtX2JvX2ZpbmQoKSBhbmQgYW1kZ3B1X3ZtX2JvX2FkZCBhcmUgdXNlZCkuDQo+DQo+IFRoZW4g
aGF2ZSBhbiBhZGRpdGlvbmFsIGZsYWcgaW5zaWRlIGFtZGdwdV9ib192YSB3aG8gdGVsbHMgeW91
IGlmIGEgQk8gd2FzDQo+IHByZXZpb3VzbHkgY29uc2lkZXJlZCBzaGFyZWQgb3IgcHJpdmF0ZSBh
bmQgdXBkYXRlIHRoZSBzdGF0cyBhY2NvcmRpbmdseSB3aGVuIHRoYXQNCj4gc3RhdHVzIGNoYW5n
ZXMuDQoNCkJ1dCB0aGUgb3BlbiBhbmQgY2xvc2UgZnVuY3Rpb25zIGFyZSBjYWxsZWQgb3V0c2lk
ZSB0aGUgb2JqZWN0X25hbWVfbG9jayByaWdodCwgc28gZG8gSSByZWdyYWIgdGhlIGxvY2sgaW4g
dGhlIGFtZGdwdV8qIGZ1bmN0aW9ucyBvciBJIGNvdWxkIG1vdmUgdGhlIGNhbGxiYWNrIGludG8g
dGhlIGxvY2s/DQoNCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPg0KPiA+DQo+ID4+IFJlZ2Fy
ZHMsDQo+ID4+IENocmlzdGlhbi4NCj4gPj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFl1bnhpYW5n
IExpIDxZdW54aWFuZy5MaUBhbWQuY29tPg0KPiA+Pj4NCj4gPj4+IENDOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+PiAtLS0NCj4gPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtLmMgICB8ICAzICsrKw0KPiA+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5j
IHwgIDMgKysrDQo+ID4+PiAgICBpbmNsdWRlL2RybS9kcm1fZ2VtLmggICAgICAgfCAxMiArKysr
KysrKysrKy0NCj4gPj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPiA+Pj4gaW5kZXggZDRiYmM1ZDEw
OWM4Yi4uMWVhZDExZGUzMWY2YiAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtLmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMNCj4gPj4+IEBA
IC04NTQsNiArODU0LDkgQEAgZHJtX2dlbV9mbGlua19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCB2b2lkDQo+ICpkYXRhLA0KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgZ290byBlcnI7
DQo+ID4+Pg0KPiA+Pj4gICAgICAgICAgICAgIG9iai0+bmFtZSA9IHJldDsNCj4gPj4+ICsNCj4g
Pj4+ICsgICAgICAgICAgIGlmIChvYmotPmZ1bmNzLT5zaGFyZWQpDQo+ID4+PiArICAgICAgICAg
ICAgICAgICAgIG9iai0+ZnVuY3MtPnNoYXJlZChvYmopOw0KPiA+Pj4gICAgICB9DQo+ID4+Pg0K
PiA+Pj4gICAgICBhcmdzLT5uYW1lID0gKHVpbnQ2NF90KSBvYmotPm5hbWU7IGRpZmYgLS1naXQN
Cj4gPj4+IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcmltZS5jIGluZGV4DQo+ID4+PiAwZTNmOGFkZjE2MmY2Li4zMzZkOTgyZDY5ODA3IDEwMDY0
NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jDQo+ID4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4gPj4+IEBAIC00MDYsNiArNDA2LDkgQEAgc3Rh
dGljIHN0cnVjdCBkbWFfYnVmDQo+ID4+PiAqZXhwb3J0X2FuZF9yZWdpc3Rlcl9vYmplY3Qoc3Ry
dWN0DQo+ID4+IGRybV9kZXZpY2UgKmRldiwNCj4gPj4+ICAgICAgb2JqLT5kbWFfYnVmID0gZG1h
YnVmOw0KPiA+Pj4gICAgICBnZXRfZG1hX2J1ZihvYmotPmRtYV9idWYpOw0KPiA+Pj4NCj4gPj4+
ICsgICBpZiAob2JqLT5mdW5jcy0+c2hhcmVkKQ0KPiA+Pj4gKyAgICAgICAgICAgb2JqLT5mdW5j
cy0+c2hhcmVkKG9iaik7DQo+ID4+PiArDQo+ID4+PiAgICAgIHJldHVybiBkbWFidWY7DQo+ID4+
PiAgICB9DQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaCBi
L2luY2x1ZGUvZHJtL2RybV9nZW0uaCBpbmRleA0KPiA+Pj4gZGExMWMxNmUyMTJhYS4uOGM1ZmZj
ZDQ4NTc1MiAxMDA2NDQNCj4gPj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaA0KPiA+Pj4g
KysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oDQo+ID4+PiBAQCAtMTIyLDYgKzEyMiwxNiBAQCBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3Mgew0KPiA+Pj4gICAgICAgKi8NCj4gPj4+ICAgICAg
c3RydWN0IGRtYV9idWYgKigqZXhwb3J0KShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgaW50
DQo+ID4+PiBmbGFncyk7DQo+ID4+Pg0KPiA+Pj4gKyAgIC8qKg0KPiA+Pj4gKyAgICAqIEBzaGFy
ZWQ6DQo+ID4+PiArICAgICoNCj4gPj4+ICsgICAgKiBDYWxsYmFjayB3aGVuIEdFTSBvYmplY3Qg
YmVjb21lcyBzaGFyZWQsIHNlZSBhbHNvDQo+ID4+PiArICAgICogZHJtX2dlbV9vYmplY3RfaXNf
c2hhcmVkX2Zvcl9tZW1vcnlfc3RhdHMNCj4gPj4+ICsgICAgKg0KPiA+Pj4gKyAgICAqIFRoaXMg
Y2FsbGJhY2sgaXMgb3B0aW9uYWwuDQo+ID4+PiArICAgICovDQo+ID4+PiArICAgdm9pZCAoKnNo
YXJlZCkoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOw0KPiA+Pj4gKw0KPiA+Pj4gICAgICAv
KioNCj4gPj4+ICAgICAgICogQHBpbjoNCj4gPj4+ICAgICAgICoNCj4gPj4+IEBAIC01NjgsNyAr
NTc4LDcgQEAgaW50IGRybV9nZW1fZXZpY3Qoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOw0K
PiA+Pj4gICAgICovDQo+ID4+PiAgICBzdGF0aWMgaW5saW5lIGJvb2wNCj4gPj4+IGRybV9nZW1f
b2JqZWN0X2lzX3NoYXJlZF9mb3JfbWVtb3J5X3N0YXRzKHN0cnVjdA0KPiA+PiBkcm1fZ2VtX29i
amVjdCAqb2JqKQ0KPiA+Pj4gICAgew0KPiA+Pj4gLSAgIHJldHVybiAob2JqLT5oYW5kbGVfY291
bnQgPiAxKSB8fCBvYmotPmRtYV9idWY7DQo+ID4+PiArICAgcmV0dXJuIG9iai0+bmFtZSB8fCBv
YmotPmRtYV9idWY7DQo+ID4+PiAgICB9DQo+ID4+Pg0KPiA+Pj4gICAgI2lmZGVmIENPTkZJR19M
T0NLREVQDQoNCg==
