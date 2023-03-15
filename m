Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3A6BB2CB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 13:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC4F10EAF9;
	Wed, 15 Mar 2023 12:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Wed, 15 Mar 2023 12:38:36 UTC
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DDA10EAF9;
 Wed, 15 Mar 2023 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1678883916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xNn+CBjtFTZl8nZrkL+kMKnI9y6k85qov/bywsyBJ9s=;
 b=DukK4J0uHKQuBPB1TZdvYEAi25EuzJ+fJMZhJJCJqAk9KXrStU20mGIM
 7LZP1w7efdH80YwU4yr4LPrM595MHqtXqEktN7SkdSgMei7CvIwRYUpq1
 QG+Fn/GXC7S7hLoOmE69Hdnvs7DanRZRVQ+EaEMqE17OgyCwfyFukC9zi c=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 103360133
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bHsJL6hUHwnHAJ1YtkuBzBsgX1615hAKZh0ujC45NGQN5FlHY01je
 htvWjiDb/uIYGKned1+a4jioUMDuJTXxtRgTwJk+3owQSgb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waDzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQFcTFXR0qG3duq3ZyHc+xzltYuJZf0adZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGybLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjA9lMTOTjrZaGhnXM6HIsGCwtUmCw//SrpE6BC41Cd
 FEbr39GQa8asRbDosPGdwexsTiEoxcaVPJZFuF84waIooLW7ByeHXMsVSNaZZots8pebScxy
 laDktftBDpumL6YU3SQ8vGTtzzaES8RIGwZbCkIVzwZ8sLjq4E+iBHIZtt7GavzhdrwcRn6x
 CqLt245nKkJitAQ1LST+krOiDah4JPOS2Yd9gjRG26o8A59TIqkfJCzr0jW6+5aK4SURUXHu
 2IL8+Ca7eYTHdSOmTaLTeElAr6k/bCGPSfajFopGIMunxyh4X/mcY1O7TVWIEZyLt1CdyXkb
 UPeogBN44cVO2GlBYd+Zo70BMo65azhDsj+EP7OY9dCb4NyaAifuiZ0aia41mTggEEqnawlf
 5uWbM2sAGwyAKFrijGxQo812r8xxzsixGrVA5P8whKm3pKXYXLTQrAAWHO1cu0m5bmY5iXU9
 9pSPdGDzRl3WejyJCLQ9OY7J00QP3E/ApzxtMV/eeuKIw4gE2YkY9fRxrUuf4FkxuJVi+7O8
 Vm0X0Mew1367VXFNAGLYzZxaLrpUr52qH59NispVX6K2mEiaIDpx6cScbM+eLVh/+tmpcOYV
 NEAcsSER/5JGjLO/m1HaYGn9dM+MhO2mQiJIiypJiAleIJtTBDI/dmieRbz8C4JDWy8ss5WT
 6Cc6z43iKErH2xKZPs6otrxp79tlRDxQN5PYnY=
IronPort-HdrOrdr: A9a23:nnaUGqiezvyqicBo7FPtLA9xFHBQXiwji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPk3I/OrrBEDuexzhHPJOj7X5eI3SPjUO21HYS72Kj7GSoAEIcheWnoJgPO
 VbAs1D4bXLZmSS5vyKhDVQfexA/DGGmprY+ts3zR1WPH9Xg3cL1XYJNu6ZeHcGNDWvHfACZe
 OhDlIsnUvcRZwQBP7LfkUtbqz4iPDgsonpWhICDw5P0njzsdv5gISKaCRxx30lIkly/Ys=
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; d="scan'208";a="103360133"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 08:31:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEaJSVVyfoM66MIFGWvvrmrX5Ds2Ej3qBabO18I7tNpWU8Pp4fGGkFXknxmwfZnEq8adMH+avKH3AYqhuWfYyleVM1b9T1wngOZEhMDKe+WDL9+XucBHK8EBIaCeJujEKKTgvnW/0IQ+2M9CuARVDHEyUD3TX9I/vfqJYiM3rMHPZ4hvn58jfpaQC9auKAP7fPT39whmIhJ5bicUiDhzUBGnEDO577RTnlEN8Al4cuno5pBuUPOO7v7BA8n/VxgAxEXNl4xqsFhSdWyMjDm3/GuDXPbDvJ+DeiT7keZKJYNsiPjuj7OnMnYGFBj+4smzmAvagTcYV30GyxZPG8l09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUFi3aCD1p4P3JI7yrknjj3N6t2foQ+yzm3wY06sJ3A=;
 b=YP7ALnOD8XDuYz+mpFoG9AHyBvniVg2h2WZ+gQW5f3yUS0xtfOYBYSOPW+eX45zLVtHQwKoyGHgTTwKp4JhM/XumM6lzXvvVzbX3Zj9fz/RW6OwT9fRWuzLr2x1e+sUKd+Kymkw+3kr+2Nlwlm6T2HMTP2nkh2kb8YumNaBoTiaywRAsnFThFoBzaw9VrK+7/xvr0Zo4W680OfxZ2VXXzCIRuFlKETYsbLsPkQKlOfcHO90GhfswMeG1ns/c3snvkx1oVJpXcLjgexFL8k+m6nC6GLY8gDl4pCzaFCNsVKFdxItQiwHj2Vu4CZ3pBj9o56OG6fYn9FPHZLoxeNDL4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUFi3aCD1p4P3JI7yrknjj3N6t2foQ+yzm3wY06sJ3A=;
 b=s7ydqrD0bOXiKsbwuAoVCZUhU9rZyysXItadelf/NAYsMZJ9he3naSmUx4Vnke8YIO8TWvfVN/V5UY3PVj1U3+LiKLWlDakndJCEMt/IuktJLSTy5Rl9vkgsdTeLXVmuB8G2CEH0QrelsLy3aABLfXVsgAjomNcd4wzFyoKdruY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from PH0PR03MB6368.namprd03.prod.outlook.com (2603:10b6:510:aa::21)
 by DM6PR03MB5179.namprd03.prod.outlook.com (2603:10b6:5:24d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Wed, 15 Mar
 2023 12:31:20 +0000
Received: from PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034]) by PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034%5]) with mapi id 15.20.6178.019; Wed, 15 Mar 2023
 12:31:20 +0000
Date: Wed, 15 Mar 2023 13:31:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC PATCH 2/5] xen/grants: update initialization order of xen
 grant table
Message-ID: <ZBG6kthkEMo4qmo6@Air-de-Roger>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-3-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230312120157.452859-3-ray.huang@amd.com>
X-ClientProxiedBy: LO4P265CA0241.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::15) To PH0PR03MB6368.namprd03.prod.outlook.com
 (2603:10b6:510:aa::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6368:EE_|DM6PR03MB5179:EE_
X-MS-Office365-Filtering-Correlation-Id: 274ca5cf-c941-447e-0e49-08db25512e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5OXo6s1EF8WLHCpo+ONQLc7kaXSHfPnWgKP88sYRJuY2E+BljQeToIAiSXXANOdI7d/zvTtIDU8jVVZz3zLe5QRbw9qrrKZdYKWE/0Lzd2pW4tZXnMKWohgR4b1SpqodR9FHpXff8UGmBF6cvNLzPIiIvbzdark95WmAvUUB9i9s6NMBCOqPwIhn0r/lj6SyAfdKrrFtVmG035kHH1zPqNIVqv9LGslFZ+Xp4CCTzx+02Sl7/G8xMlVZJLX7sW9nrTJbZL6CpgdTd1nmqS8MSJ7BRVuPJH5hmNy1W+yfQpW8KnAc38wYOZvnyY/AuzDMuE5plWM5ZFNgXMTmyB8hIJJAFtS1LSk042eLINvqIIFpSFLsHZO/CISwIOuKD9N9RRD06AD/LAOCRvXLTSxDLWQsvjGqAAYGa5ta+xCA2HHuQaw0qUfXf5ejmazsDys+MEMZj6XeuR/nJ2KDGELOuc+weyzVq58o+FUi1yK1Ez+yx2uDIfdGU3YPmmP67SjXRGnrKod2TGTIv4kE2qtNyJC7992ntVB3SUGDLmy5nsrVQ/CCDktZscse26SGR+tEcHiO4wYrxc7yeX37KHjyO9ypDywqVJcr1aaLmC+IRwhnxXpFnfFtV+Y654eYpBXQfqtTVCqytDGL6GYlwUqfWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6368.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(7916004)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199018)(41300700001)(7416002)(8936002)(5660300002)(15650500001)(2906002)(38100700002)(85182001)(86362001)(82960400001)(478600001)(6916009)(66946007)(66476007)(8676002)(66556008)(6486002)(6666004)(33716001)(4326008)(83380400001)(54906003)(316002)(6506007)(9686003)(6512007)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXovcTJ4TkJpbXJqOE94Sm9LcXU1c2IzLzFPdU42NXZKMFBCNlNvemdnUHc2?=
 =?utf-8?B?ZTg3TUpjemcxelZ5Vld2a3d0MDhUMlBDamc3emJLZmpUQkE1VzUzc281OHAw?=
 =?utf-8?B?Vm82V1Nra0V2L3RBcS9hUlhydG5xaDIxM3k3cHlSOXBQZHRXSHZDdnNKeWpm?=
 =?utf-8?B?UWdhbmdCQUpzdHNUWVQ3djc5Snl5OXFqa1VIQm5xYVdnNDdtQ1ZIc1ByS2Ro?=
 =?utf-8?B?MGRPdk5Kd0tnbDlhN1ltMlRkVEhqS0MvMVByYnBlcURlaUdVTmx0bzBBdlhp?=
 =?utf-8?B?OW80LytTcWloM3dHb0FSZS9xRWRQV09wMzAwdGZzVkhCTFJwZVphNUs3azFB?=
 =?utf-8?B?RDVIdExVcy9pLy8zcm9oeHo2aDFkKy9UTXZQYUdEc1ZMVDRvUVJkMWJTdDF1?=
 =?utf-8?B?bjBDcUUwcFR5ZWRmVm9rdnlaU3YxakR2blVIZjlMc25SaDRYSWtDeGZMZVF5?=
 =?utf-8?B?RHpnWlRYeDJmZU5MdkhIeFNKVEpDN3VLUTBzR2lUQWNmd1V0cldqZnNOTENM?=
 =?utf-8?B?ZDY2Tk0vSkZ1SzRhWGdVTndzby9Bb3g1L3NSNmNHUXpZcnA0dnNrOVVpSWRt?=
 =?utf-8?B?Z3lNaXNxd2JrbjhBRXJKMzU5SkpoVmp1UndKMGdRSVovQ0hJRGovcEY2K2ti?=
 =?utf-8?B?UVQwSXFuVDVxR01xVlBiSitic0p5a0VOMmk3d1QxRW9hVFYwaTgwZ2xTZm5S?=
 =?utf-8?B?YjF1QnJGVTNkVlJ3NVBIY1lzNm5MME1WanZFT1g5ZVlSS3hRQ0E4L3dWRHZF?=
 =?utf-8?B?ZFBCVGxJbmQwYVpVV1ljRHhHTFpCd1RRMEYvNU5EUXE4ajBJYnhyM0Q0OHRj?=
 =?utf-8?B?c2FDNmZzcFM2d2NtYjZXVXFTdjFzZlZIeHgyd09ud0VKY1dmaXdhb3hRQ0lL?=
 =?utf-8?B?N3ZiZksxazFGOVZUcmdjdXNrZlRsMlYxcDNJbEpLM05pUGVtVzVMRVZFcGFJ?=
 =?utf-8?B?REx5ZCtPWFNtOUQxS2xZamo4MEowUnBDWWNVRFRUMTM0R0haOGRTclByZ09x?=
 =?utf-8?B?WlI5L3pJblRSbmZlZ2VMZytGL3o5WVJkMG9yR3VTbWdEbnVpTXdJUTVTMEVv?=
 =?utf-8?B?S3VGQkxNSGNocEhMdDZjT3ArREN5WUdCV0ErWHd6L1IybXhzWkgvbVhoZnpH?=
 =?utf-8?B?Ukw1d2xkTmtDQXBVL1A0Vm1OT0I4Q2ZqNkVYNFFtUFp5ZFlOaVArWHF4c2JS?=
 =?utf-8?B?TFFUNW9qTmNtS21KZjhlM0lqMy92b1NuQ3d3QjRZVHcvTGFzYnc5OEhJNFNw?=
 =?utf-8?B?OEhTdXoraW1JNk5TaCt0UWc4cGJINDI5M2lyYW1vVEQ1OEJ1WFpVSEZZb2JC?=
 =?utf-8?B?WHdsVkRxMlZDQitWSzYrdU1vQ3QzWURqT3NjMmpxR3M3TjZHODdNVHZwTlR5?=
 =?utf-8?B?MjJvTWZnbW1rMm96WFl4SnJ2MUxWNVFvbVBxd2F4RFhYdzBFUlBSUDRlczNK?=
 =?utf-8?B?Qkp5dkthRXRZQ29EUkNjT0xHV3FRVmhzaGVBZk1RUTdEbHAzQ0dXaUhQVjF1?=
 =?utf-8?B?ZlRVODR0bmFKdkVzREVJY0hKQUNsNDhLMlY5OG5WVDIrNDQ2VHRwV1Q3eUVY?=
 =?utf-8?B?QVdYZlY1N3NIUEtRRHdNRWN1clVJVVdUNFloUmQ2TThoK0c2Q1dCSVhrTXpK?=
 =?utf-8?B?WEIzbllISnBQa1FJcVNlajFvNkVBR3JZMSthM21FYXZHSVRxYUhycXhlNFFU?=
 =?utf-8?B?RUhRYnlIOCtRdTVnbjAxTFFwZit1YTQ0NHQrM0JVRjlJQnoxUERsV1FzR3do?=
 =?utf-8?B?dk1JdjhNZzdzcnpBUUtvUmFSZCt6YThUYXdrZ2JiZm9aVUpaRzFVTElMQnha?=
 =?utf-8?B?dXc5eU9VUlVrRUJaOEZVY2syaElpWkZmSHNJL0EyRGNSbHZySDdVRW9XTllW?=
 =?utf-8?B?MWlnRnVYaDdOS0UrbW1MTzIvMWhWcXJObEoyS043UE9mQjBOV0FlUFRMd1Yx?=
 =?utf-8?B?TVpvSmlNeHdYYXJmYUd5WE9kSlFRZlQ3ekloQ0hqcTUwYXB0ZFFsTnU1Ymdt?=
 =?utf-8?B?Vy9zMzMzRnNrNTNOTnNkcldsek5XZDJiOTJBTlRqZlhIY3doQlZrWmtZblJu?=
 =?utf-8?B?RWhPK2p2cUhOODAwZERYdmFKQ2o4ZlNXRGgyNXpMeE12YTljMGxGMHEvWkJB?=
 =?utf-8?B?MjNGSE1FSjUyTGhWU00wTHBmWVNGOTRxUDBWb3Blc2orY0s3cHlJcVc1dFFq?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?MVNUMTNLR3Rkc1NFVnpDNGdDSkovRjA0RDRXOTBGelAycnVOZElxT2lLTTJU?=
 =?utf-8?B?Z1JPdUJlcml5dENxQ2RVMHFpU2x4UzVnRUg2UUdGSU9McjRYeVBzeWpGNE9R?=
 =?utf-8?B?NkZsSkxOamhRYjBSSCtrbUJyQUxOZ1RBSWQvVUFGYlF1aXNsWWZITHZnSisy?=
 =?utf-8?B?MVhLRko2ZG9OeHhsMjFrRnBzNEJwcnVnZDBUSjZaazFDUTRkcG84WXFGdDcv?=
 =?utf-8?B?SjRyeTkzWTVwaFhqbDJ6Zm5TZFYvY0h6a2tnVVAwWWlzZkV2ZFJiMFdKTGIw?=
 =?utf-8?B?YlFlSlN2VklEQjNiZVJxaW5rK3hWMkU2blM3eXFpcGhicEhLVW1mN1VvL2VC?=
 =?utf-8?B?RFlZdWZDK0o0VldCaFNvRndMOTRJY3hmaVZyVXdwK3cyTmtMZmxjSHl5WWFM?=
 =?utf-8?B?NzRpL2R3cmc3ZWdiWlNtMElWQ1dWWGVpMzdMck5OK2NkZWEvMjRFV2p5c0VK?=
 =?utf-8?B?aHlWU25reEZrMG51ODM0MmZHQ21VMXpXMWQ0cmRYcG9NODFZeDdhUEtzWXZz?=
 =?utf-8?B?V1o1eEFvSDUwdVF4NlFibXpjNFcxbVhQUDRSZE9obHBBMjhhUHc5enRhWHlN?=
 =?utf-8?B?WTQzZ1daUStxS0ttck5wZmN0M3FXQWNVY0dodEh4UWRQZnRkUFdWaiszQ1VI?=
 =?utf-8?B?T1FFYVg4UzhXWEpMMXBuUzFXRFBDNnhwZjhqcC9rVnFNdWhqTEduU3FTeDFF?=
 =?utf-8?B?M2IvcDlJSUtlWEZodGFzWmcxK1pCRjVhNlZ4S1BndFNyd2k5MzFEMUp0Sitk?=
 =?utf-8?B?V3RnMEhSS0lqeldCWkdWVGR0YjVHd0ZiSGswMVpmeFNFZFF4WmEybWJXYUJs?=
 =?utf-8?B?UnBPbGhjSE5GS3pRalB1ZDk5Tld5TGlxSkhNT2JqV29sOUpWVUxvbDJIVEdy?=
 =?utf-8?B?alM2WVMrNkE5MWlrV2pwbnVFVllNR0ZQTW5rYk51Q1loQWhVRHNueU9lQXNH?=
 =?utf-8?B?bTZQeElSckZ4N0hxOWhsZW92cW5ZUXFqVzFHcDhjd1ljbkVBL0p1b1NnM0Zh?=
 =?utf-8?B?TGFzVTNob01zVkI1dGtUWDc2QjREbnQ0ODhhWmNwb0NqdEtleEdvVEsvSWp4?=
 =?utf-8?B?VXJGNDBQVUh3dWhpNk5tTkovRUNhbUExUm5LTmxjUlNWeE1xN2ZFSkFBRk5y?=
 =?utf-8?B?N25uei9zSHp6c2NlQnVJaXg2TEFXbndBVXZpNFQ2cVdnU0xTYkEyOFo5WE56?=
 =?utf-8?B?NFNZUVlITUQ5dVlEUlFtZmVtTWhEUVpmYWF6QVdCYlJMbXlvZmFSWUZxU2du?=
 =?utf-8?B?T1pHUlErU3Q5VUJXdjJ3WjZJc25nc0pSS1E3WUhGN202enpFYjJOV2NoMEtH?=
 =?utf-8?B?RGN1aXFFOXZWQnZtV0hidzM1Wk9tL1c5ZEJ2L2RJUGJBaWxkVXVuZUgxMk85?=
 =?utf-8?Q?fG9S66Y0f2E/NS5NghoYhT3ZaYSVxT3o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 274ca5cf-c941-447e-0e49-08db25512e06
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 12:31:20.1065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4brcGzUI8sO+8xnsAB0+NFYKwNKRERLDP4lq8Y/HVjwBtsZm4E1eYcIXfacZgCMi5+BohRyXrCijImkhLmcEtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5179
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
Cc: Juergen Gross <jgross@suse.com>, Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 amd-gfx@lists.freedesktop.org, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 12, 2023 at 08:01:54PM +0800, Huang Rui wrote:
> The xen grant table will be initialied before parsing the PCI resources,
> so xen_alloc_unpopulated_pages() ends up using a range from the PCI
> window because Linux hasn't parsed the PCI information yet.
> 
> So modify the initialization order to make sure the real PCI resources
> are parsed before.

Has this been tested on a domU to make sure the late grant table init
doesn't interfere with PV devices getting setup?

> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  arch/x86/xen/grant-table.c | 2 +-
>  drivers/xen/grant-table.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/xen/grant-table.c b/arch/x86/xen/grant-table.c
> index 1e681bf62561..64a04d1e70f5 100644
> --- a/arch/x86/xen/grant-table.c
> +++ b/arch/x86/xen/grant-table.c
> @@ -165,5 +165,5 @@ static int __init xen_pvh_gnttab_setup(void)
>  }
>  /* Call it _before_ __gnttab_init as we need to initialize the
>   * xen_auto_xlat_grant_frames first. */
> -core_initcall(xen_pvh_gnttab_setup);
> +fs_initcall_sync();
>  #endif
> diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
> index e1ec725c2819..6382112f3473 100644
> --- a/drivers/xen/grant-table.c
> +++ b/drivers/xen/grant-table.c
> @@ -1680,4 +1680,4 @@ static int __gnttab_init(void)
>  }
>  /* Starts after core_initcall so that xen_pvh_gnttab_setup can be called
>   * beforehand to initialize xen_auto_xlat_grant_frames. */

Comment need to be updated, but I was thinking whether it won't be
best to simply call xen_pvh_gnttab_setup() from __gnttab_init() itself
when running as a PVH guest?

Thanks, Roger.
