Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F183BF603
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDA86E21C;
	Thu,  8 Jul 2021 07:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6166E1D2;
 Wed,  7 Jul 2021 19:57:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xb8d8+ZEODpHBiAKHAnssQKWbBThQE6VxB6JYcZDgEdGWXsRNBs+qmvIfazBdgye5/+GHB4KgcLRvBhxMnjJfjRlNSOc2M57zYI5JutSLcMOMooZbg45S7cCatc8gMPp2zJwAZtYAFHcsMHeYuKtjewT4Mk8zMkf9dKq+CAkeF1muiFU/qe+sWe1dBJp5v9Zb8IO1SvaRyeSNWmuaBa3TVH2+ej3t8ZKOb1pIWHEqVJ9x+cVSX0sPuPXgHpsI8USImv0F+GdYBRN3vdQg5swdqPIWYkjGBFUxEvbr3ETXHOE6MbcupJ/d/o+wxG1x8Xc6bOylZLa72AKJdongyLS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taqFP1BIeewcbULXHsFPA6QEqHqpKKSFiIwWIxnnZI8=;
 b=Yun46IdUQFjwP+CclRQB2Il9R/wrRQR4IxzZt2XEBIFdaLpsBoSs/PrV7UilW7KQyR5UJ7wZVV8wdVca1Y3GawcdGAuqm19KQXjtNNzNFosvjuCh+h0pXoeFamvaekGx5vWCfX+5rHW+0ySTmtfefrTnM3/XfDq/ZoUkWhmPr/vT4u90KBY6fTkGBJdvZlObXqnSvyRzLaEmvuWds+woBq4VdBWLTAVKRmW49qhX9Rgn9jZsO3JwUf0S8s2vn1gUaCWQndvjDyxZHaMBZCsU9bE5FF1zb/F7BXYI0hIYmQ5zrVcqw4SavJhpNmopqJ3awhD/pNr209u4kEuhmHW4zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taqFP1BIeewcbULXHsFPA6QEqHqpKKSFiIwWIxnnZI8=;
 b=Cr99NLHi7bmG/lmNt7TilWaYT65KVj5y5Q7asn5kiU2boTb2K3MUd2xelc6c069n7Qp6sGChid2+0TIqty4WxgGuPdW9+Qwfud3ZnhqXrf29TFfAiAXTfrXhqGaiXCi26Tt2EMRf8KmwFgaTglgsf2ICgPTjrv4Dk374UXrA178PNdoRHQXto0nstwWVZM9LPqTSO+mUd5HY6MTdvhV6RQpwNPQSMmQp/sevbz6/tNogthPQ9j6XWiF3YxiHf9w72MuYiYJ9RoZG8gSMtmT7oBD03GfuDYbQC+1SHRhtcPaKg8X1GVba9WkFbOO0/G64k3nImx7uBtXpKnN4Q690iw==
Received: from MWHPR21CA0046.namprd21.prod.outlook.com (2603:10b6:300:129::32)
 by DM5PR12MB1707.namprd12.prod.outlook.com (2603:10b6:3:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 19:57:49 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:129:cafe::1b) by MWHPR21CA0046.outlook.office365.com
 (2603:10b6:300:129::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.2 via Frontend
 Transport; Wed, 7 Jul 2021 19:57:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 19:57:49 +0000
Received: from [10.2.166.240] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Jul
 2021 19:57:48 +0000
Subject: Re: [PATCH v2 1/2] drm/i915/opregion: add support for mailbox #5 EDID
To: Anisse Astier <anisse@astier.eu>, Ville Syrj?l?
 <ville.syrjala@linux.intel.com>
References: <20210531204642.4907-1-anisse@astier.eu>
 <20210531204642.4907-2-anisse@astier.eu> <YLZXQLh2Qmxs+CWU@intel.com>
 <YLa22EBqxE2sBdpp@bilrost>
From: Daniel Dadap <ddadap@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <43427294-b19b-f32e-3b75-479eac6628ca@nvidia.com>
Date: Wed, 7 Jul 2021 14:57:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLa22EBqxE2sBdpp@bilrost>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00516ea9-d366-479b-2dc2-08d941817f93
X-MS-TrafficTypeDiagnostic: DM5PR12MB1707:
X-Microsoft-Antispam-PRVS: <DM5PR12MB170735CECAF69CF27EBCBFDEBC1A9@DM5PR12MB1707.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +FMxlLZ1ck/pLAruLYczlAzQCSmASLPakpF7HysPIvYFCZq2HOXnNxAglPQqlqBqyx82zFUQ7MClh5qZS3vAgVJ/abaPNlKMpJwEIESh58463EWAmQ7BtB1JUpA1MmWWe5C659cdHcVu/7mOnEZQLigZM5RZSZheK6MDGn+KoPl2bO28TbmGURnhjznl3r42codWyzuQRzQCacv42ta1USBqYJ+uOTyDSLajtglFPM/bp725afSYSTn5OqRipHdKDY1e6b4vDbBKDhyqTzU07OzT2dItUpAkFvarKTe2eKY4K3HZx/dl7CSAb9z3MpWiHU0dJeI7m/9bsgfnduoxclqpLmhoTtf/OikNzN+0pM9YgWeJRiltuPU92zJp5Q9n8vkeAo5bthYp3x8pEdttq+OOZvA9G0GU2W7w5ENcg/uyAzx3IAdIL7YhuYOq9leuq0DxqnFWa8TPXjq7iXMFW/F187WwlG8gvJXoJ318Za/ydfblgAAZ6U6c98jYH1tOQa7BrBAH6kOZZiAfHzQQdqKmou1jaA3pQIbcPOXhGoRhq3CFaqYjSXnWOs/shH6xJ0NJ3UbdWVP9u63rTYax0+01FhJuvS8RU4/+9Ut6D6n2GDy9AHgvbJqcZ363gGLsCWFpp5acmqyGA3cBn3L9LFsu+Y+DMCK22Y2h38J935tpOCXIlVNB4+ufSZSkvdzWFXePVKmHhkgn7reJ+AgEYImaFQElqjdjvm3IcAkxg3FqB1asAKeeSr9ka24+JBw9yf9xQaNo14xXB2dOyo10t2c/kMRsP6LS2NwV1Xv6BII0ELd3vGbc2kNDYBdmbu1w
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(36840700001)(46966006)(16526019)(2616005)(82310400003)(36756003)(336012)(8936002)(47076005)(53546011)(15650500001)(5660300002)(966005)(478600001)(70586007)(31696002)(83380400001)(2906002)(7636003)(426003)(86362001)(16576012)(36906005)(8676002)(186003)(54906003)(110136005)(356005)(26005)(31686004)(82740400003)(36860700001)(4326008)(316002)(70206006)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 19:57:49.5545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00516ea9-d366-479b-2dc2-08d941817f93
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1707
X-Mailman-Approved-At: Thu, 08 Jul 2021 07:08:27 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 intel-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/1/21 5:43 PM, Anisse Astier wrote:
>
> Le Tue, Jun 01, 2021 at 06:50:24PM +0300, Ville Syrj?l? a ?crit :
>> On Mon, May 31, 2021 at 10:46:41PM +0200, Anisse Astier wrote:
>>> The ACPI OpRegion Mailbox #5 ASLE extension may contain an EDID to be
>>> used for the embedded display. Add support for using it via by adding
>>> the EDID to the list of available modes on the connector, and use it for
>>> eDP when available.
>>>
>>> If a panel's EDID is broken, there may be an override EDID set in the
>>> ACPI OpRegion mailbox #5. Use it if available.
>> Looks like Windows uses the ACPI _DDC method instead. We should probably
>> do the same, just in case some crazy machine stores the EDID somewhere
>> else.
> Thanks, I wouldn't have thought of this. It seems Daniel Dadap did a
> patch series to do just that, in a generic way:
> https://lore.kernel.org/amd-gfx/20200727205357.27839-1-ddadap@nvidia.com/
>
> I've tried patch 1 & 2, and after a fix[1] was able to call the _DDC method
> on most devices, but without any EDID being returned.
>
> I looked at the disassembled ACPI tables[2], and could not find any
> device with the _DDC method. Are you sure it's the only method the
> Windows driver uses to get the EDID ?


_DDC only works on devices that actually implement it, and the vast 
majority of devices don't, because the display just provides an EDID 
normally. AIUI, usually a device will implement _DDC either because an 
embedded panel has no ROM of its own to deliver an EDID, or to allow the 
EDID to be read by either GPU on a system with a muxed display, 
regardless of which GPU happens to have the DDC lines (in TMDS) or DP 
AUX routed to it at the moment. (To my knowledge, nobody actually muxes 
DP AUX independently from the main link, but there were some older 
pre-DP designs where DDC could be muxed independently.)

I'm not sure whether the comment about Windows using _DDC was meant for 
this device in particular, or just more generally, since DDC is part of 
the ACPI spec and some Windows GPU drivers *do* use it, where available. 
If it was meant for a particular device, then it's possible that the 
ACPI tables advertise different methods depending on e.g. _OSI. If you 
haven't already tried doing so, it might be worth overriding _OSI to 
spoof Windows, to see if _DDC gets advertised.

I'm not sure how you were able to call _DDC without an EDID being 
returned as described above, if there was no _DDC method in the ACPI 
tables; I would expect that attempting to call _DDC would fail to locate 
a suitable method and do_acpi_ddc would return NULL.


> Regards,
>
> Anisse
>
> [1] _DOD ids should only use 16 lower bits, see table here:
> https://uefi.org/specs/ACPI/6.4/Apx_B_Video_Extensions/display-specific-methods.html#dod-enumerate-all-devices-attached-to-the-display-adapter


Thanks; I don't see a version of your modified patch here, was the fix 
just to mask the _DOD IDs against 0xffff?


> [2] acpidump: https://gitlab.freedesktop.org/drm/intel/-/issues/3454#note_913970
>
