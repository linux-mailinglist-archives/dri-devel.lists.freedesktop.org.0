Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C802030217B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 05:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE4A897FB;
	Mon, 25 Jan 2021 04:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F77897FB;
 Mon, 25 Jan 2021 04:55:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iv88atHp/UptDDAypbiTpIpEZixVGFJ2+wWyyjCXOnFkE0Ek8iOlN5ALEmLOrSzSqMzvodUhpLhUFjLM6Ihrigpy9fAMVgBy7aZc0lKVDSPDyI0SAJva9eFObXJcsjLMfi8hdm9qpPVB1N0CQwouObb8aWsq3Y29WYs5xRQZ5Py7LM0JLBQBY+H63Vuu74UBycxFYiI7hiGdnHe06O9p+Jr1LyeR4R5ym9WTNWU/wn4DORfgZyCYyZBGfrtTnu0rIbwoWuFaDWKmCadeDVUDa+VaPfCuoZxmpPmI//v4eg+xXLg0hhmbEjT5kbGLJlB79+byFaB0BbdGZTqXU2KdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp8eCqYmBEweyxEU/prNnGOT84MXbwil9v1bH9b/ofs=;
 b=XTtXIBwUTi9TjqnlrCKHYFsGsgZsr/Tdg4KQ2xSzFlUalgROtCYFXepto4bVCEe6BiGfIAQYZmMX4ErNT/cAh0kgFyqzHxrtkzBpeiBb2VJ3newAZ+izz7A90OENPMpJbmNYAJGXpj9icC/oRUiP6W1A7n83yM+LadaHkhKDhbp8ApH5liQd7GVw9IbOAF0wr9PHjxuOhAlMuXA2heXJMj5MXE//hlxLS0ZNY8ZiFSMdd0zJRc+7BET1Se/rHaXwJKdRdfYZqlD19LGuPy1s9omQq+92MfEIqafU0T+1hfibCgE3idfVONjgv8ojpsxiKzUnegEuoZ3asY61KTNSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp8eCqYmBEweyxEU/prNnGOT84MXbwil9v1bH9b/ofs=;
 b=1bDGOd0BuTx61QOXkyoRkVCiopXsSJNj0+m3l/fxN83RjKY7hhyY922UM6lh6d7tCuEPI+0jMMkGS2eDMSeNZj8HgFJpgZrJLJ9Wohauid1LY+GwUunOf7eEdzzAFcqx1RLW42T3vLBIjraNcSnk1vIK6SBqU/SllRake/ai1Ww=
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR1201MB0182.namprd12.prod.outlook.com (2603:10b6:910:18::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Mon, 25 Jan
 2021 04:55:23 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::bc0f:dd2:ef80:de2]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::bc0f:dd2:ef80:de2%12]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 04:55:23 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: Tree for Jan 22 (amdgpu)
Thread-Topic: linux-next: Tree for Jan 22 (amdgpu)
Thread-Index: AQHW8WuKWRhWuGQmpEyStMMh+HbJc6o3xnAQ
Date: Mon, 25 Jan 2021 04:55:23 +0000
Message-ID: <CY4PR12MB1287FE09EB65A01875FF7F2FF1BD9@CY4PR12MB1287.namprd12.prod.outlook.com>
References: <20210122180643.7039571c@canb.auug.org.au>
 <64dd3a50-a836-c1b7-738e-6b6b5433117a@infradead.org>
In-Reply-To: <64dd3a50-a836-c1b7-738e-6b6b5433117a@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-01-25T04:55:21Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=06f6c7b2-6eda-494c-9011-250f079e6267;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ba337e8-73c5-4994-5b01-08d8c0ed6c9f
x-ms-traffictypediagnostic: CY4PR1201MB0182:
x-microsoft-antispam-prvs: <CY4PR1201MB0182B749B02D8A18FDCF4756F1BD9@CY4PR1201MB0182.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qVRzdF6Thyx8rOTU8Ejo0+Zyz9js0Wp1QuISmZxtBiuGjEfEgi1/EtqxOkUO7osqk3Zsb16IWLjRwG+EMxYi72kn67IzY1X6t1iGQlCRjiaNdeC4Lq+kR4BwpYgJSFJKzD9EdZX51eHsZsQwyTUtR2gN1MkyH2/v/AnV6aD+lYFSvTHle9pnR07GPvzCwnCPR5WxoxzX68A4BQX9KY3bJuRAC/HIJue6ys1HkjxvfCkwYOW08xYca9Rbbzp1YjhFLbRDW4j0rd/ok6T50pZaVO1Ca5zkUJFMZoloeSQEpk5R85Rl6CM2rz65oQVewcno56t6cBI10W2mPC/1BWMShjv87KXTqMsK7szMIGqCdAbixdDfxZFoLhHVEMLX4GJWZ0/QoKFA6iCQVEAkaixxZMHqLnt9sw1lWJUXRLF05RA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(26005)(71200400001)(966005)(54906003)(110136005)(53546011)(5660300002)(45080400002)(8936002)(316002)(9686003)(478600001)(4326008)(186003)(66476007)(33656002)(6506007)(66446008)(55016002)(66556008)(64756008)(2906002)(52536014)(7696005)(8676002)(83380400001)(86362001)(76116006)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?S7jKMlsJ0OGSg4fRbfX7WgQnZ6hdrBcruCVeWobBtMidkVAGIpTsSlDHpNuz?=
 =?us-ascii?Q?D0DpfHf5fxZdW7mrkGEcj5mOdEJUwwsOCdKwuotiG05pJhKunB+okvjDsH3R?=
 =?us-ascii?Q?u2PtKz88vOx2NzVRhqWohMQRqXW3GsLhPQi8/yGm7D6Ut0PDT9W4kjv48v1z?=
 =?us-ascii?Q?+z0/1QIubCIkv7zvlEMISh8yhKgrRohewFlohS/coAZHG6WgjDbCtqwmMMoe?=
 =?us-ascii?Q?eamZhl2T7OFB36qc7cMlklje/hff0jGvSSUKxLfkapEqLrWmfJsw9lsay9OB?=
 =?us-ascii?Q?S6K4aMkE6m0ltrmRxarSHojstwJAxKxe+u3cDBcFRIogCLVh4Olmp8GBBulV?=
 =?us-ascii?Q?eUZrvn1r6HEQ2jdMSMLB5twmK3OxddqqIP1rh+z6XVkffHXlpeb5MUBpx9HP?=
 =?us-ascii?Q?RwB8HGvkPhp6P8blI9Gl/MC05TAiiRPbkZQL1oYrugLhQBVcpsCO1/x0ehod?=
 =?us-ascii?Q?xkmy0WwsbqcXTX1CVMR/B7bsw1beGoFhUg8TKdB+7hpTcsGQ/lB9/Q+FIaiH?=
 =?us-ascii?Q?EU0BOS3k6kp9cP5UW7jw1LM4pYzt5GAyybZaqbOVc74CYRD8WvcphAH4H+ou?=
 =?us-ascii?Q?aTmcVGXdcpffN9vcIgvZgLQc/WGrL4/ofwK36wdCVnvcLZqi1gfhIfhQPfiW?=
 =?us-ascii?Q?tOpGNDJ0FZzO3Jg47/fCVUDXnU3bFZvpWvPECpYxgQE2w54TRtXGG5TiXbW9?=
 =?us-ascii?Q?f8Q6kT/ACiDqKbSh/vruqrgKaXQAWtBk2vk0BAriU9YL0U3j4h19BBqdfL19?=
 =?us-ascii?Q?QQ0Cj5f2FIi6PDCY1kAn128PeygoK7JciMHdDrSAlwutdRjcKdPwKy587dN5?=
 =?us-ascii?Q?H9gg4ftbth0h+ZPvQsZ7d0Dm+KF4neCNntf4WJjnSwvTBJG9wibqCLOXkbJz?=
 =?us-ascii?Q?3pKlh8k4HLXpFXXeft6RBbXVoQEOblu4dpEgscsf02BDMFetFnX0Ahp9zBrd?=
 =?us-ascii?Q?3Uk4Cr8L1Mkvzvw4DgXP1rRSX8z8pEXdWV3N1Ts+XTyECQn7/lDV+ynQQAq6?=
 =?us-ascii?Q?csG9Rt6v7AIg/DF4fc5fXecF7StB2Q0b3xo6iZzXdPOQT+3nOLgcAvhyohdJ?=
 =?us-ascii?Q?WgAOqEH6?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba337e8-73c5-4994-5b01-08d8c0ed6c9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2021 04:55:23.3720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PckjjepFt4dWvEufRfh4vOV6EWrrd6BFVAqb0ni7dW63F0ebUB9IagArKkKQMyJSglbZQJojDW3/tyzlU156jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0182
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

The link error has been fixed by:

5da047444e82 drm/amd/display: fix 64-bit division issue on 32-bit OS

Regards,
Guchun

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Randy Dunlap
Sent: Saturday, January 23, 2021 2:02 AM
To: Stephen Rothwell <sfr@canb.auug.org.au>; Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: amd-gfx@lists.freedesktop.org; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: Tree for Jan 22 (amdgpu)

On 1/21/21 11:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210121:
> 

on i386:

ERROR: modpost: "__udivdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "__divdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!



-- 
~Randy
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cguchun.chen%40amd.com%7C32b5c3dbae684672163608d8bf82ab0c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637469915239051891%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=0a61RTCcYsAXilfnxqSzPXxA2q6sIYDKEkMWL6HGJro%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
