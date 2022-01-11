Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4939A48A9C9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 09:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ABB11360E;
	Tue, 11 Jan 2022 08:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B6211360E;
 Tue, 11 Jan 2022 08:47:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBvT97Af5Nf6/W2J3+SebMFQNyYLBhp1F12BYtPlOOqR0Cr1nlXHGioqOaaZMGTfQdX+ONJcnse73YUBTZZ0F7cukbPpMIwzppGH+Oe/kVz8k/vNFlmUeKc2p+b10a8TXkFMcA1bmBsL/6ZsuWJZoMcciomWylOc90zNsBt9Z4D2wSVrJQCjgf6MoYYD+OYCo0WHtlBJ8mAx+h/qDmmOxUTRRCAMkH9I/bV5vEeqYYEcnyDI+Rpb3WoqwEs5IW7fDQ08Fzo58IEnkoNfISj4YdSDRvIj4AN+4WlUWdShyKBxMZWg5PUI51LpXBjlgjY0Zh/glckgkUIHDQ8zMMiWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PAxhShjxAeGrs2Ps6PCSc5b0X7R5WekjnTRNh8P0Xg=;
 b=XW1hU2gqN5i4iOO/r48gtll3aDUTXJYuQAgiMeprYIFnpatSCtNcFbnGnbrpGhqlkO+7Or20gxCPY5suYQy3YkVNsVW8OWoRBi4kM85KQSDJbOyFcabAgABNsydIeRJ7mFhNk8hmziV712UJalA7f1IXQvccTIiOO5fL/MbYp/61Jht0I/+1cJRM+sF5/IrJjMWYA2uW3TsxpSW/XnxPY3Zg8Iey53swOS4OWeUz3lxIVdfYnYu+4ULrm9IWrE+H0hBUP8ZYF0ije07nh8qWNFe/oEmUOozUB2e37niwkdfaovHAzv9HNY0KpEI4HqPhqcV3HJWbSjAQjCX8Hxn7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PAxhShjxAeGrs2Ps6PCSc5b0X7R5WekjnTRNh8P0Xg=;
 b=2Q6hHfQRjscwxLhCyam0sx0rOiNevrSXZY8fFVu04mBG2UzWXgqUrU6dBXH/KNyN6hxU95oBEcWcsnkTIQiG1w3AL5qsBCUtlp0ez5msUKeizOQvNoOsO+JFwmZc4RlQqjLOdUw65fNksYIzWgtbrLuSDAdAQd7gEcSArYekd+E=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 DM4PR12MB5325.namprd12.prod.outlook.com (2603:10b6:5:39e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.11; Tue, 11 Jan 2022 08:47:44 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::1500:4b8c:efd6:672]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::1500:4b8c:efd6:672%4]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 08:47:43 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOWbnuWkjTogW1BBVENIXSBkcm0vdHRtOiBQdXQgQk8gaW4gaXRzIG1l?=
 =?utf-8?Q?mory_manager's_lru_list?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGRybS90dG06IFB1dCBCTyBpbiBpdHMgbWVtb3J5?=
 =?utf-8?Q?_manager's_lru_list?=
Thread-Index: AQHX1VvfGiamfxE0yEqVAKGPQSb88av7Hb4AgAACCACAAAHwAIAACIoAgAAC6ACAYrevoA==
Date: Tue, 11 Jan 2022 08:47:43 +0000
Message-ID: <DM5PR12MB246972E69DADF83D83FD9C73F1519@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20211109111954.41968-1-xinhui.pan@amd.com>
 <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
 <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <76d78ff7-efe4-4796-ec18-a668757f2e04@amd.com>
 <DM4PR12MB51657C53FAA6C096884118AD87929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <DM4PR12MB51658A8C75586BCC2B0BDA6487929@DM4PR12MB5165.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB51658A8C75586BCC2B0BDA6487929@DM4PR12MB5165.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-01-11T08:46:58Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=7aa3c55d-d563-4d71-8e37-6dc135c6fe7d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-01-11T08:47:40Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 4cfb9acd-3a66-4da2-8d7b-551e20b0f984
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6dd6962-9c57-428e-ed65-08d9d4df08c9
x-ms-traffictypediagnostic: DM4PR12MB5325:EE_
x-microsoft-antispam-prvs: <DM4PR12MB53257B4CCA09ADC1CD85C5F6F1519@DM4PR12MB5325.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kgBjiiE2nUHoeIngf4A7h/Xikwllq8SNMMiIaZtYWadMfVRRAhOAqlew0iFnuRW5cUQP1PdmTw/oVyvSKbZ3hG3UrpMqLCjJWpBiNCwanZp+tQenuvr+TkPvr96zaAvT1bdxfzcR+SFQc8yBGbDPjUo4DfLlC7J21xX6dI3unG/xcPhiT2oKk1kZ1sGFO/89Pe6SpMqe9HCio5sSHg/t79O5kO3sRvAHW30WhhW64Kmvca696itzN8cd7i3ee/CpaEAsRGu8TKEpvi3IbAJU0Z3EfvXHB1JitJBHPhKnSpkHmjSETN1KhWaBJ/jH28esF6qdn64C+cZPiXUM2HWC4UxbrIytxw7Gyq1gnCVdr57xmG2sahFVtRHDofCdtHv9uT301lx04jACL0liwH2/lhC0ztEK41qFqqGSatbEEc285jtfhYHlYeXihr+KPrzWkkQ29j8N3/lNDcaLIIdXq2BMtIPsgz1Gz2Ff8kNGV3ZUZmTySqn+PYLER0P+89Mi1ovOnpWwlc0faBZ9J5fv2ZH7nZCuzhWcIQ8B5W5vtCv7MfQot6b+mBjFA5QlEcNnMl6p1FfdJ1WXG/BbPOjwwmmwj/ID3Kx9yHBiGbjpzYoBA1uiwvfy7zG4giivCR3wMVQUJBf47enUcbOG+I+bowat+liD04ywiKRGAZR50iRPHY4ruCdNnfOOIYVS7fq5K6aW5MI7ejRV5WQw9uVrm3cwAeyfpFH7ivYqgPfroaeKQUIK3heauvE3J8+LC0lXxtJh4JfnNl90c/NuEDVfhOOLsZkqgJC5qsm1UlNKtPw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(86362001)(186003)(66476007)(450100002)(110136005)(4326008)(5660300002)(64756008)(7696005)(52536014)(38070700005)(224303003)(8936002)(966005)(122000001)(6506007)(38100700002)(9686003)(66556008)(508600001)(26005)(2906002)(71200400001)(66574015)(83380400001)(66946007)(76116006)(316002)(53546011)(66446008)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVo2NVhjUUdYWHM3d2VOMEJVUTRNMnpyUWFUOHd0UXFIUVNOTEU4azlkekdV?=
 =?utf-8?B?VmRYZlQwcDFWNXZrb3RmZjJnNGlyT1JISTlhdG50aFA2ZUZNL1l2UkF3YUNW?=
 =?utf-8?B?RkVoRXdrTUcwdmN0ZlRvei80NE9ra1VEQmNTWWludnhiOHBxVmlPSDNPREYy?=
 =?utf-8?B?MXp5RjcxUHljTlc5M2VnSG83dEZYdklwTzBqM1dzSjZRWlJxYUpkNmpmWW50?=
 =?utf-8?B?UDlPaTB6NXA5M2J1WWFDWVloQlJnQVZRV25DdWMyYUNFWDVRTzk4Tk04TS9C?=
 =?utf-8?B?cTRqcjZSUzJ6aTVtYUR1a1BLZmhGTnJFRmpPRDgwNFZhR3c5VnRDcnphUVc4?=
 =?utf-8?B?SVZ2OHpCSkkvZUdwZ0FYNWtISS90Qkh2VWp5SUcyTkxRaERxNE40Snl2aStn?=
 =?utf-8?B?SzNjbDdoRkNTTW1NaEhnaHh0Ujc2UlcyUFR4UWxpZW15SHl3aFdkZmxCeUV6?=
 =?utf-8?B?RGdnOERJTnBlUnhyLzQwanpQMi9Vdy9yTW9ZbzRWLzNXcWozeHpwak9GVlRy?=
 =?utf-8?B?ZnFrbjFqdVhNVHdVaFgxWFZ3M3Fldmc3QWVldERKTlFXQ2t6QU9jUEh5SS9s?=
 =?utf-8?B?dkFtS2s2aHA1elJqRXI2dGVoUERLVlVBbm52K1padllpaDRuNlpNc2xHRkVN?=
 =?utf-8?B?T0xTSW9Kdk5iOG16N1lEQjlQSU50WjFJbzdIakU3aHY2UE9wdU9URUtpYTRz?=
 =?utf-8?B?V0VkUzJDbkdtUkdLcnBWN0FrRmFRTlpKM1dOMEZUZCtwcHltNFJlUEEvbkZE?=
 =?utf-8?B?K2ZDSFQvUEhaSkdqYWtIRk9DM05DT21mbktPQ3l1ZGl0TXZDaCtFWTdsZEdP?=
 =?utf-8?B?MWRmemtKcTdxV1VFY2plazI3QXpqY1AwNEVxMkY2cnFvdWMxbkpDVHdjNHpM?=
 =?utf-8?B?YnJRSmRpc0k4dGFSdGJzelpVOExzSFk0a3Y0bXVIaDljUmt6RjZYelZhTFNY?=
 =?utf-8?B?VVBEbkNtTzdiMGE0RG9JdTBLTzUwMTF5UEJTR3l3WVB0TFNFd0EvOVpMMTN1?=
 =?utf-8?B?cFJ3MFR0SldvZ0lpTlBWNEpKMkhjVVpIb1d1ZDcycnlCNWVoN0JadVNQRGxq?=
 =?utf-8?B?dThJZHNvMEgrR0hLTHFQUlBLSmJKeStaQ3dkT0RiM0NVRWc4SWF3N0dHcW9h?=
 =?utf-8?B?cmROOThqV3FsUldHTlhDM3RFalNJK3VVNnVLc0ZGVEhnbkJqZ051MmFiZ2F3?=
 =?utf-8?B?b3Jocm91VnZTbmozT2w0dGFvczJRalgrVVFTNnM3dS9udGVUZk9WeVdzdTlY?=
 =?utf-8?B?U01ycXBYR0FXYnNWaVNLM0IyY0tyVFJOSlIyMlNsMnF6aHFPZUI5WEdhNHdP?=
 =?utf-8?B?aTQzNityYzRFekQ4Y2NQK1AyWm9PZ2IxUUh0M0R5cW9YY3JvVEcyNlhBdEJt?=
 =?utf-8?B?cllhU0h1dUs5bU1ub1B0ZjhGQ0l0UWk4ajdwNUJoSzUzZk1neHVidDRxRVBi?=
 =?utf-8?B?K3BEVDM3eE5UcWVXZWhlZlVBZlBsOEhnWkZlSzB3ckFFQ1N4WFg3a1k1dmlo?=
 =?utf-8?B?S0pESnZucDB5UVBTWnZ6SWw3S2xTVnNHeW53MzZnQ2txcEhDWXZVc0k1YkNQ?=
 =?utf-8?B?YkRacVhKb3QyQTI1anNtbk1WNFArS292akhsTzQ5SW1QcnltRjBscTVPcy9k?=
 =?utf-8?B?a2VoSURycWVQbWEyWjBYbjVKaFFQR3NFY25mNkc5SFREQ1dCOGJldHYycnRl?=
 =?utf-8?B?eEU1N3F6ejg3MWdzOHBNUnZqWE4wMXZjRjZ1eGQzczNqSTAzUzVOTFV3M0pE?=
 =?utf-8?B?a1lBeVlBcnV6bHFvak9ETWtKQytsa2p6bTg3SzRQUU1SeWtHUk9RY0RIYk80?=
 =?utf-8?B?Z2paRnlKd1hvcGJxNUdwRW53TkJrRVZxTTFzajJ2Qm9WM1BMMSsvckU0T3hU?=
 =?utf-8?B?REVIMmZHZjBWSUlXWlFlN1pHR2haN0FzVW4waENTUnh0dWVSVElWd01Ndy8y?=
 =?utf-8?B?dVdwSDFoMlJwNWdLSE1vcEZ3aGNHK3QwT2UzMi9vVXdLLzVBbndMYW1lNFZN?=
 =?utf-8?B?WjBTSXYyODhydGl6aHNpaElWWXVDaE56RVBmYktMNUJTSHV2TndTYmZPeHBM?=
 =?utf-8?B?WEw0UDNIQlJ6alM0NC94SDc2enpsRmJXU3IxcTJmVFFiTjIraTRkWEdBMEFn?=
 =?utf-8?B?SDAvNWdNSVpacGtTRlVKQVI0U2ZyRHVxS3k5TnN4VDhEYm5kL3Z5TmRtQ0Nt?=
 =?utf-8?Q?9FSKK3m7yRR9QCtz9zYS7kg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6dd6962-9c57-428e-ed65-08d9d4df08c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 08:47:43.7695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lSKebP6Sob0xt7o9dVG5Pc4xOvUjXPtwieq0vnDamWH76woYhLDfWrqX6Qj2n6xRYak6MgWYGqHJsCwgWVJ52Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5325
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KSGkgQ2hyaXN0aWFuLA0KDQpMb29rcyB0aGlzIHBhdGNoIHN0aWxsIG1pc3Nl
ZCBpbiA1LjE2IGtlcm5lbC4gSXMgaXQgaW50ZW50aW9uYWw/DQpodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jP2g9djUuMTYNCg0KUmVnYXJkcywNCkd1Y2h1bg0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2Vz
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFBhbiwgWGluaHVpDQpTZW50OiBU
dWVzZGF5LCBOb3ZlbWJlciA5LCAyMDIxIDk6MTYgUE0NClRvOiBLb2VuaWcsIENocmlzdGlhbiA8
Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiDlm57lpI06IOWb
nuWkjTogW1BBVENIXSBkcm0vdHRtOiBQdXQgQk8gaW4gaXRzIG1lbW9yeSBtYW5hZ2VyJ3MgbHJ1
IGxpc3QNCg0KW0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KW0FNRCBPZmZpY2lhbCBVc2UgT25s
eV0NCg0KQWN0dWFsbHkgdGhpcyBwYXRjaCBkb2VzIG5vdCB0b3RhbGx5IGZpeCB0aGUgbWlzbWF0
Y2ggb2YgbHJ1IGxpc3Qgd2l0aCBtZW1fdHlwZSBhcyBtZW1fdHlwZSBpcyBjaGFuZ2VkIGluIC0+
bW92ZSgpIGFuZCBscnUgbGlzdCBpcyBjaGFuZ2VkIGFmdGVyIHRoYXQuDQoNCkR1cmluZyB0aGlz
IHNtYWxsIHBlcmlvZCwgYW5vdGhlciBldmljdGlvbiBjb3VsZCBzdGlsbCBoYXBwZWQgYW5kIGV2
aWN0IHRoaXMgbWlzbWF0Y2hlZCBCTyBmcm9tIHNNYW0oc2F5LCBpdHMgbHJ1IGxpc3QgaXMgb24g
dnJhbSBkb21haW4pIHRvIHNNZW0uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQrlj5Hku7bkuro6IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+DQrlj5Hp
gIHml7bpl7Q6IDIwMjHlubQxMeaciDnml6UgMjE6MDUNCuaUtuS7tuS6ujogS29lbmlnLCBDaHJp
c3RpYW47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQrmioTpgIE6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCuS4u+mimDog5Zue5aSNOiDlm57lpI06IFtQQVRDSF0gZHJt
L3R0bTogUHV0IEJPIGluIGl0cyBtZW1vcnkgbWFuYWdlcidzIGxydSBsaXN0DQoNClllcywgYSBz
dGFibGUgdGFnIGlzIG5lZWRlZC4gdnVsa2FuIGd1eXMgc2F5IDUuMTQgaGl0IHRoaXMgaXNzdWUg
dG9vLg0KDQpJIHRoaW5rIHRoYXQgYW1kZ3B1X2JvX21vdmUoKSBkb2VzIHN1cHBvcnQgY29weSBm
cm9tIHN5c01lbSB0byBzeXNNZW0gY29ycmVjdGx5Lg0KbWF5YmUgc29tZXRoaW5nIGJlbG93IGlz
IG5lZWRlZC4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCmluZGV4IGM4
M2VmNDJjYTcwMi4uYWE2M2FlN2RkZjFlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMNCkBAIC00ODUsNyArNDg1LDggQEAgc3RhdGljIGludCBhbWRncHVfYm9fbW92
ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2aWN0LA0KICAgICAgICB9DQog
ICAgICAgIGlmIChvbGRfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNICYmDQogICAgICAg
ICAgICAobmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUIHx8DQotICAgICAgICAgICAgbmV3
X21lbS0+bWVtX3R5cGUgPT0gQU1ER1BVX1BMX1BSRUVNUFQpKSB7DQorICAgICAgICAgICAgbmV3
X21lbS0+bWVtX3R5cGUgPT0gQU1ER1BVX1BMX1BSRUVNUFQgfHwNCisgICAgICAgICAgICBuZXdf
bWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSkgew0KICAgICAgICAgICAgICAgIHR0bV9i
b19tb3ZlX251bGwoYm8sIG5ld19tZW0pOw0KICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KICAg
ICAgICB9DQoNCm90aGVyd2lzZSwgYW1kZ3B1X21vdmVfYmxpdCgpIGlzIGNhbGxlZCB0byBkbyB0
aGUgc3lzdGVtIG1lbW9yeSBjb3B5IHdoaWNoIHVzZSBhIHdyb25nIGFkZHJlc3MuDQogMjA2ICAg
ICAgICAgLyogTWFwIG9ubHkgd2hhdCBjYW4ndCBiZSBhY2Nlc3NlZCBkaXJlY3RseSAqLw0KIDIw
NyAgICAgICAgIGlmICghdG16ICYmIG1lbS0+c3RhcnQgIT0gQU1ER1BVX0JPX0lOVkFMSURfT0ZG
U0VUKSB7DQogMjA4ICAgICAgICAgICAgICAgICAqYWRkciA9IGFtZGdwdV90dG1fZG9tYWluX3N0
YXJ0KGFkZXYsIG1lbS0+bWVtX3R5cGUpICsNCiAyMDkgICAgICAgICAgICAgICAgICAgICAgICAg
bW1fY3VyLT5zdGFydDsNCiAyMTAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0KIDIxMSAgICAg
ICAgIH0NCg0KbGluZSAyMDgsICphZGRyIGlzIHplcm8uIFNvIHdoZW4gYW1kZ3B1X2NvcHlfYnVm
ZmVyIHN1Ym1pdCBqb2Igd2l0aCBzdWNoIGFkZHIsIHBhZ2UgZmF1bHQgaGFwcGVucy4NCg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQrlj5Hku7bkuro6IEtvZW5p
ZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQrlj5HpgIHml7bpl7Q6IDIw
MjHlubQxMeaciDnml6UgMjA6MzUNCuaUtuS7tuS6ujogUGFuLCBYaW5odWk7IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQrmioTpgIE6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCuS4u+mimDogUmU6IOWbnuWkjTogW1BBVENIXSBkcm0vdHRtOiBQdXQgQk8gaW4gaXRzIG1l
bW9yeSBtYW5hZ2VyJ3MgbHJ1IGxpc3QNCg0KTWhtLCBJJ20gbm90IHN1cmUgd2hhdCB0aGUgcmF0
aW9uYWwgYmVoaW5kIHRoYXQgaXMuDQoNCk5vdCBtb3ZpbmcgdGhlIEJPIHdvdWxkIG1ha2UgdGhp
bmdzIGxlc3MgZWZmaWNpZW50LCBidXQgc2hvdWxkIG5ldmVyIGNhdXNlIGEgY3Jhc2guDQoNCk1h
eWJlIHdlIHNob3VsZCBhZGQgYSBDQzogc3RhYmxlIHRhZyBhbmQgcHVzaCBpdCB0byAtZml4ZXMg
aW5zdGVhZD8NCg0KQ2hyaXN0aWFuLg0KDQpBbSAwOS4xMS4yMSB1bSAxMzoyOCBzY2hyaWViIFBh
biwgWGluaHVpOg0KPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5XQ0KPg0KPiBJIGhpdCB2dWxrYW4g
Y3RzIHRlc3QgaGFuZyB3aXRoIG5hdmkyMy4NCj4NCj4gZG1lc2cgc2F5cyBnbWMgcGFnZSBmYXVs
dCB3aXRoIGFkZHJlc3MgMHgwLCAweDEwMDAsIDB4MjAwMC4uLi4NCj4gQW5kIHNvbWUgZGVidWcg
bG9nIGFsc28gc2F5cyBhbWRndSBjb3B5IG9uZSBCTyBmcm9tIHN5c3RlbSBEb21haW4gdG8gc3lz
dGVtIERvbWFpbiB3aGljaCBpcyByZWFsbHkgd2VpcmQuDQo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4g5Y+R5Lu25Lq6OiBLb2VuaWcsIENocmlzdGlhbiA8Q2hy
aXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiDlj5HpgIHml7bpl7Q6IDIwMjHlubQxMeaciDnml6Ug
MjA6MjANCj4g5pS25Lu25Lq6OiBQYW4sIFhpbmh1aTsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4g5oqE6YCBOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IOS4u+mi
mDogUmU6IFtQQVRDSF0gZHJtL3R0bTogUHV0IEJPIGluIGl0cyBtZW1vcnkgbWFuYWdlcidzIGxy
dSBsaXN0DQo+DQo+IEFtIDA5LjExLjIxIHVtIDEyOjE5IHNjaHJpZWIgeGluaHVpIHBhbjoNCj4+
IEFmdGVyIHdlIG1vdmUgQk8gdG8gYSBuZXcgbWVtb3J5IHJlZ2lvbiwgd2Ugc2hvdWxkIHB1dCBp
dCB0byB0aGUgbmV3IA0KPj4gbWVtb3J5IG1hbmFnZXIncyBscnUgbGlzdCByZWdhcmRsZXNzIHdl
IHVubG9jayB0aGUgcmVzdiBvciBub3QuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogeGluaHVpIHBh
biA8eGluaHVpLnBhbkBhbWQuY29tPg0KPiBJbnRlcmVzdGluZyBmaW5kLCBkaWQgeW91IHRyaWdn
ZXIgdGhhdCBzb21laG93IG9yIGRpZCB5b3UganVzdCANCj4gc3R1bWJsZWQgb3ZlciBpdCBieSBy
ZWFkaW5nIHRoZSBjb2RlPw0KPg0KPiBQYXRjaCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiwgSSANCj4gd2lsbCBwaWNrIHRoYXQgdXAg
Zm9yIGRybS1taXNjLW5leHQuDQo+DQo+IFRoYW5rcywNCj4gQ2hyaXN0aWFuLg0KPg0KPj4gLS0t
DQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgMiArKw0KPj4gICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGlu
ZGV4IGYxMzY3MTA3OTI1Yi4uZTMwNzAwNGYwYjI4IA0KPj4gMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jDQo+PiBAQCAtNzAxLDYgKzcwMSw4IEBAIGludCB0dG1fbWVtX2V2aWN0X2ZpcnN0KHN0
cnVjdCB0dG1fZGV2aWNlICpiZGV2LA0KPj4gICAgICAgIHJldCA9IHR0bV9ib19ldmljdChibywg
Y3R4KTsNCj4+ICAgICAgICBpZiAobG9ja2VkKQ0KPj4gICAgICAgICAgICAgICAgdHRtX2JvX3Vu
cmVzZXJ2ZShibyk7DQo+PiArICAgICBlbHNlDQo+PiArICAgICAgICAgICAgIHR0bV9ib19tb3Zl
X3RvX2xydV90YWlsX3VubG9ja2VkKGJvKTsNCj4+DQo+PiAgICAgICAgdHRtX2JvX3B1dChibyk7
DQo+PiAgICAgICAgcmV0dXJuIHJldDsNCg==
