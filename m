Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E22285ECE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 14:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C826E8D0;
	Wed,  7 Oct 2020 12:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A0B6E8D0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 12:10:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfCVbPqnS2xoTzE7ig9CzNU40R/qK2v2Iq5Wc/tCWnw5HQq6QkE6egZBp5TDX6jzQDBIsHbmYZkOzwjCME0z2x3wq3IqlUitZaAnLdgP1gzjQFGjYoMRP+w7FhbjmKgKK5SAZBuKdTWeV/z3xa0prEO+wscREmJgLEwiNrHXhTvejAnhhwnSZYf28WVQJ4tU+oL3N70tAIivLiJfE/JHB9K8jDCTB+8R0STesKFxgWeGxzS74PBpeVBwTqgLP1I7ua2AcZRSWDd8idOGXKyUaAa4wU8hfDV/Wk+HGWkpUEslP/vpuOMsHOeix8tXBbN7+Li5j625+pr/kcyhfdjMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDTQxGRFiyc6k4JgdXaRAnJ3/2trqTkehAdcM5uEuwo=;
 b=A2gPL18vdyECsRwnv2PmqHorPjzvo8xFLTh/a0U15CXo5ZVn3rL5BKe1p3JpPE0ESjfoBmh0fQhUm1ycHP5w43WBblUYocR5syx0qyTZg4l+biqQCs9Z7LpBbk67kgoZW5Mor+ZOH5Mf9cMtHAtWIdnfxy0e2s0oAwmDdgNfXXb+kzQkXliCzlO9MbtnUwyUqX77MIfdjXGj/l/ILmkFU8dEVS/VDcctfKgA2p2nKK9uJtDm6ZGOdPfccy06/dYaGwxEk81d5mmoc3UVcPE2pa/sLWRpzzdWlHqkZedwOcTTcdRf9C+jOG6nijQIxIirCMaQd3gSizaMIyjuhsXgmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDTQxGRFiyc6k4JgdXaRAnJ3/2trqTkehAdcM5uEuwo=;
 b=bkujNIRHT3Kl9c1CgjyExQzzLV1KE7IoJX46IyhY5U3mTA/2FvSIyp/EVpI6ZmRBQm1XwGsdtxq4G13nOklyjQB1ydg+hTHJRpa5doArbmpHAc8/GpmVpH2DTRi2H2EVYxDZLVySc2M3T3rPzObCtGS4DQuDAuR30zHE/gOl4l0=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4897.namprd12.prod.outlook.com (2603:10b6:208:17e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 12:10:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3455.022; Wed, 7 Oct 2020
 12:10:05 +0000
Subject: Re: [PATCH 2/8] drm/ttm: move ttm_set_memory.h out of include
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ray.huang@amd.com" <ray.huang@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20201001112817.20967-1-christian.koenig@amd.com>
 <20201001112817.20967-2-christian.koenig@amd.com>
 <43090043dbd54c13ab48abd81baea49e@intel.com>
 <7c9f8939-55bb-e93d-0ab8-36dbb0c211f1@gmail.com>
 <df616a2ec450404b8b3a5aee02353de0@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <40cb4822-b998-6ed5-5262-f06c444ab7ca@amd.com>
Date: Wed, 7 Oct 2020 14:10:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <df616a2ec450404b8b3a5aee02353de0@intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0110.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0110.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Wed, 7 Oct 2020 12:10:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2df7f2eb-a82b-4a84-24de-08d86ab9ed58
X-MS-TrafficTypeDiagnostic: BL0PR12MB4897:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4897CFF65382626D4FA75D1C830A0@BL0PR12MB4897.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YgQ1vP6schU8cLBnI3ffehnAWglJ4bTMboANxfatK8RLBF+ykU52qm+udtHn/3qcK/wdSXmNMz97rlOhIR8s3AJaNpNB1SveBJIK5uCazuf9kN7X07OH4a/+pHHSQFNK+/sajEwsZ24uXQHjs1uaaWPlTxqAqGoI3Qp69F6LwR8o+81ku4V5ab/DuwBOl71wou0wTcle3K3h4BsxLB+8AiUpchYMON3a7tl1blk/8Yd9YN/qz5DpYIgC7M7N6K62oC72p76UgmVyD6vW285gYs5dRaUXkLwoc0iY7/FTsFzkfiYj1r9fy3zZNz35x7hAExYSqEdCJ8jMSflvtfeyEb6ZFJRMyvD6P9eBJXVnvGm/rava0Gj0KWxBj2yrm6pZWOuf3D8v8uQ2KVTpHESKo3I5b1hyom9bKX7WKChIztg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(186003)(8936002)(66476007)(66946007)(16526019)(66556008)(36756003)(66574015)(2906002)(83380400001)(966005)(52116002)(86362001)(110136005)(8676002)(5660300002)(31696002)(31686004)(2616005)(6666004)(316002)(53546011)(45080400002)(6486002)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 9gExorxZFzRtsNA4ZUdmsyWKx6MmeKj3wxz1GKHh/cdIoI2volbCeI2n9XsjgVEhFeiUIiaS7ZzLp1JckymPaXMJHd/YazncUkbSMvnJW9SIEqCBOTi0QZUestYHkUDaPXOXT/uWNBovTwP9AFiSveWsezQgqTDVFlDhkSZ000Rv5thLVpvmBm/mEnqcCBKtOarZKUCndVx4HLlne2uEm2lvpC/eNCIZGz8mD4TvMM8kInsFZj9F3OiRVuvcBZ0lxXUEq8IAgQ5xIaD8e9Ur1W2rSorys+1RkcxiMm/6bOl5nqOWmwoJ2iUjOHtDqWmhEDP2g7HxFfbVmhPiRtimNI3EWZxmJY3SHZtSPUnBAS6EmdV1wqeNWfwgl7bXyvtF5dJAa37CerAiAuHW1dVlRIO3fNmSoxg6aMgPYXzF8GstStKHrg83ft6NtBV0AgKUz6aObKYnwowoYH1bo65P0X2O5N/tO2nkcFrhM0b/jKuUg0RT5EjnTOaf5AwpGphXbbJid10B3IrpDiaGEByTODDyHUmspmgwj/rd50cOe7zJ6t1m3tfYEFZcWb9A6TYeEH7kAOlNz8eB/oEjFcbk+oAck/d1fFhSzeTC12GuIl8V9q3iFpMQ4+48MTyZcydFxuupxmaGpZM0HFTDPB+glAhRxkrXp9wUFiJY37/UdNAGmVaB9znKxq4zlwII7IkeHoqA4hgfOVOpyDNoimms/Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df7f2eb-a82b-4a84-24de-08d86ab9ed58
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 12:10:05.7715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S11dGbavx2nltXhg3+sFRyOviYDqB8TYnTlVdHVkHCfZzS6nqHsX1G2BuY4+U6+Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4897
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMTAuMjAgdW0gMTM6NDYgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVp
Y2h0enVtZXJrZW5AZ21haWwuY29tPgo+PiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgNywgMjAy
MCA0OjMxIEFNCj4+IFRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNv
bT47IGRyaS0KPj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyByYXkuaHVhbmdAYW1kLmNv
bTsgYWlybGllZEBnbWFpbC5jb207Cj4+IGRhbmllbEBmZndsbC5jaAo+PiBTdWJqZWN0OiBSZTog
W1BBVENIIDIvOF0gZHJtL3R0bTogbW92ZSB0dG1fc2V0X21lbW9yeS5oIG91dCBvZiBpbmNsdWRl
Cj4+Cj4+IEFtIDA1LjEwLjIwIHVtIDE3OjAxIHNjaHJpZWIgUnVobCwgTWljaGFlbCBKOgo+Pj4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2
ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZgo+Pj4+IENocmlz
dGlhbiBLw7ZuaWcKPj4+PiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxLCAyMDIwIDc6MjggQU0K
Pj4+PiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgcmF5Lmh1YW5nQGFtZC5j
b207Cj4+Pj4gYWlybGllZEBnbWFpbC5jb207IGRhbmllbEBmZndsbC5jaAo+Pj4+IFN1YmplY3Q6
IFtQQVRDSCAyLzhdIGRybS90dG06IG1vdmUgdHRtX3NldF9tZW1vcnkuaCBvdXQgb2YgaW5jbHVk
ZQo+Pj4+Cj4+Pj4gVGhpcyBpcyBub3Qgc29tZXRoaW5nIGRyaXZlcnMgc2hvdWxkIHVzZS4KPj4+
IEl0J3Mgbm90Pwo+PiBUaG9zZSBhcmUgaGVscGVyIGZ1bmN0aW9ucyB3aGljaCBhcmUgdXNlZCBi
eSB0aGUgdHdvIGRpZmZlcmVudCBwYWdlCj4+IHBvb2xzIHRvIGNoYW5nZSB0aGUgZ2xvYmFsIG1h
cHBpbmcgb2YgcGFnZXMgb24geDg2Lgo+Pgo+Pj4gSSBhbSBub3QgcmVhbGx5IHN1cmUgd2hhdCB5
b3UgYXJlIGRvaW5nIGhlcmUuCj4+IE1ha2luZyBzdXJlIHRoYXQgbm8gZHJpdmVyIHRoaW5ncyB0
aGF0IGl0IHNob3VsZCB0b3VjaCB0aGUgQ1BVIGNhY2hpbmcKPj4gYXR0cmlidXRlcyBtYW51YWxs
eSA6KQo+IEdvdCBpdC4gIFNvIHNob3VsZCB5b3UgbW92ZSB0aGUgaGVhZGVyIHRvIHRoZSBkcml2
ZXJzL2dwdS9kcm0vdHRtID8KClllcywgaW4gdGhlIGxvbmcgdGVybSB3ZSBwcm9iYWJseSB3YW50
IHRvIG1vdmUgdGhlIGZ1bmN0aW9uYWxpdHkgaW50byAKdGhlIERNQSBBUEkuIEJ1dCBmb3Igbm93
IHRoZSBUVE0gc3ViZm9sZGVyIHNob3VsZCBkbyBhcyB3ZWxsLgoKQ2hyaXN0aWFuLgoKPgo+IFJl
dmlld2VkLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4KPgo+
IE1pa2UKPgo+PiBDaHJpc3RpYW4uCj4+Cj4+PiBNCj4+Pgo+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Pj4gLS0tCj4+
Pj4gZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5jICAgICAgICAgICAgICB8IDMg
KystCj4+Pj4gZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvY19kbWEuYyAgICAgICAg
ICB8IDMgKystCj4+Pj4ge2luY2x1ZGUgPT4gZHJpdmVycy9ncHV9L2RybS90dG0vdHRtX3NldF9t
ZW1vcnkuaCB8IDAKPj4+PiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPj4+PiByZW5hbWUge2luY2x1ZGUgPT4gZHJpdmVycy9ncHV9L2RybS90dG0vdHRt
X3NldF9tZW1vcnkuaCAoMTAwJSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bh
Z2VfYWxsb2MuYwo+Pj4+IGluZGV4IDE0NjYwZjcyM2Y3MS4uOTEyYzMwZGNjOWRiIDEwMDY0NAo+
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYwo+Pj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYwo+Pj4+IEBAIC00Nyw3ICs0Nyw4
IEBACj4+Pj4KPj4+PiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmg+Cj4+Pj4gI2lu
Y2x1ZGUgPGRybS90dG0vdHRtX3BhZ2VfYWxsb2MuaD4KPj4+PiAtI2luY2x1ZGUgPGRybS90dG0v
dHRtX3NldF9tZW1vcnkuaD4KPj4+PiArCj4+Pj4gKyNpbmNsdWRlICJ0dG1fc2V0X21lbW9yeS5o
Igo+Pj4+Cj4+Pj4gI2RlZmluZSBOVU1fUEFHRVNfVE9fQUxMT0MJCShQQUdFX1NJWkUvc2l6ZW9m
KHN0cnVjdCBwYWdlCj4+Pj4gKikpCj4+Pj4gI2RlZmluZSBTTUFMTF9BTExPQ0FUSU9OCQkxNgo+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5j
Cj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jCj4+Pj4gaW5k
ZXggNWUyZGYxMTY4NWU3Li4xMDQ1YTVjMjZlZTMgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvY19kbWEuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMKPj4+PiBAQCAtNDksNyArNDksOCBAQAo+Pj4+ICNp
bmNsdWRlIDxsaW51eC9rdGhyZWFkLmg+Cj4+Pj4gI2luY2x1ZGUgPGRybS90dG0vdHRtX2JvX2Ry
aXZlci5oPgo+Pj4+ICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmg+Cj4+Pj4gLSNp
bmNsdWRlIDxkcm0vdHRtL3R0bV9zZXRfbWVtb3J5Lmg+Cj4+Pj4gKwo+Pj4+ICsjaW5jbHVkZSAi
dHRtX3NldF9tZW1vcnkuaCIKPj4+Pgo+Pj4+ICNkZWZpbmUgTlVNX1BBR0VTX1RPX0FMTE9DCQko
UEFHRV9TSVpFL3NpemVvZihzdHJ1Y3QgcGFnZQo+Pj4+ICopKQo+Pj4+ICNkZWZpbmUgU01BTExf
QUxMT0NBVElPTgkJNAo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX3NldF9t
ZW1vcnkuaAo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fc2V0X21lbW9yeS5oCj4+Pj4g
c2ltaWxhcml0eSBpbmRleCAxMDAlCj4+Pj4gcmVuYW1lIGZyb20gaW5jbHVkZS9kcm0vdHRtL3R0
bV9zZXRfbWVtb3J5LmgKPj4+PiByZW5hbWUgdG8gZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fc2V0
X21lbW9yeS5oCj4+Pj4gLS0KPj4+PiAyLjE3LjEKPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+PiBodHRwczovL25hbTEx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0
cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZkcmktZGV2ZWwmYW1wO2Rh
dGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDNDIxOWY2Yzg0NjhmNGQ1
Mjk3YmQwOGQ4NmFiNmFkM2MlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAl
N0MwJTdDNjM3Mzc2NjgwMTEzMjg4NDc2JmFtcDtzZGF0YT1HOElPMGlNWldBUk95QkpaUlNWcmgl
MkZYZ0ZJJTJCM2tFTzU4U2k2Y2QlMkYlMkI4bzAlM0QmYW1wO3Jlc2VydmVkPTAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
