Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B03D53A6
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 03:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D939A6E0F1;
	Sun, 13 Oct 2019 01:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515946E0F0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 01:03:55 +0000 (UTC)
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9D13otW021997
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 19:03:50 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9D13mmw021975; Sat, 12 Oct 2019 19:03:48 -0600
Received: from BL0PR03MB4051.namprd03.prod.outlook.com (2603:10b6:a03:e0::36)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BYAPR05CA0095.NAMPRD05.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 20:06:13 +0000
Received: from BN6PR03CA0050.namprd03.prod.outlook.com (2603:10b6:404:4c::12)
 by
 BL0PR03MB4051.namprd03.prod.outlook.com (2603:10b6:208:69::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Wed, 9 Oct
 2019 17:44:03 +0000
Received: from BY2NAM01FT014.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e42::206) by BN6PR03CA0050.outlook.office365.com
 (2603:10b6:404:4c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 17:44:03 +0000
Received: from ipmx3.colorado.edu (128.138.67.74) by
 BY2NAM01FT014.mail.protection.outlook.com (10.152.69.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
 id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 17:44:03 +0000
Received: from mx.colorado.edu ([128.138.67.77])  by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 11:02:55 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 10:32:42 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731496AbfJIQcl (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 12:32:41 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34290 "EHLO       
 mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org       
 with ESMTP id S1729644AbfJIQcl (ORCPT       
 <rfc822; linux-kernel@vger.kernel.org>); Wed, 9 Oct 2019 12:32:41 -0400
Received: by mail-ed1-f66.google.com with SMTP id p10so2631605edq.1 for
 <linux-kernel@vger.kernel.org>; Wed, 09 Oct 2019 09:32:39 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96]) 
 by smtp.gmail.com with ESMTPSA id h7sm425812edn.73.2019.10.09.09.32.37   
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);        Wed,
 09 Oct 2019 09:32:37 -0700 (PDT)
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
Authentication-Results-Original: mx.colorado.edu;
 dkim=hardfail (signature did not verify
 [final]) header.i=@ffwll.ch
IronPort-SDR: AZAn8PUMbKXIDkANr1UvWWltm/1KwuP2Y50pZzeDrsrEADESReJL8MFef7/cARRCLJhx5vlu+O
 rgxlN5GWt1xbwXVQp5TcUaw1DSa7PNFcI=
IronPort-SDR: lldM2bm/aOyih3R+VyGusdhyV1CcDrSSuzAkcy4D78sz1CsT6BraScAzfWOkQ636V4brzajsmU
 eIBMVhl06fZvTupE1x10ezP87oeamO8d0=
IronPort-PHdr: =?us-ascii?q?9a23=3AhdTsNBFdjb2b7eiAOiT90Z1GYnF66ZnXHytQx4?=
 =?us-ascii?q?Quj69HbqWk+cm8ZR7BsKw+xFacR57SrulEgrCL7fOoUjka7JKIoH0ON4ZBUx?=
 =?us-ascii?q?YVhMlF+m5oSIbNQQWzZPK/YSIlGMAEX182t2ruPk9SF8LzNDiw6jX6pXZaUl?=
 =?us-ascii?q?3/YBF4IOj4ANzehti6he6o/JiBfwIajzHveq54Lhi9sVfUu9INiIRvb6c9mB?=
 =?us-ascii?q?7Ao38NdeNSwWR3OErWgxGZhI/4tNYru2wY86A7+sBNS6j8dKkjH7lZCTljLW?=
 =?us-ascii?q?0v/8zss0vISg2T630AF2kXiQJPGAnZ7Rb8DJb39zH3ru5snTWdb9DtQKpxUD?=
 =?us-ascii?q?uv6bs4LX2gwG9Pf3ZxuGvX3+VrtrBl5x+l9y4h3ojMQ6SqDcplL62Deo8GRm?=
 =?us-ascii?q?VcfPddSC55BtzlSpkCKLZUboM658G17xNG5VO0UAeGXf3A6Wd51l7X270U1M?=
 =?us-ascii?q?IgFyv/2FQdQYkwqnKTt/rfL/dNaMrswonM5DzqMs923x3i1pXiL0p8pdHTBK?=
 =?us-ascii?q?lLS9Pu8yxNX0uNxh3Y4cStYC7M+KdRmUed38V4a861uzENrgMrvxvzxuEGsp?=
 =?us-ascii?q?vWp60bxXPJ+wV2+NZuHJrgaEw8b+6mNaFpvS7LOa1ET8I+fnNWqAVfqPVO8d?=
 =?us-ascii?q?bzNGBCgKo8hA/Ca+CJX6jW+D/nSeivCApYmihkJJuvii/xyRT919HDR/jhgx?=
 =?us-ascii?q?5a6ytfld/UsWoRkgbe8dWDVq59912t1z+O01Ob+qRFO0cyja3BN9ss2KQ3jM?=
 =?us-ascii?q?8IsEvFFzPrgki+gK6aPkMj5qC25v7mbKSulZGdMYZwv1KkaPYHh9C/DOIkMw?=
 =?us-ascii?q?MHQ2mc/6GG2ab++VHiEOkYi+1wma7dt4rTKcNdq6KkUEdZ0Ycmvha2FTuo2d?=
 =?us-ascii?q?Uc1TkcLV1DcQ6alYWhN1DCaPb/Eb+hjk6tniYj9P7HOLTlN9SFLnXKnLr7O7?=
 =?us-ascii?q?cow0BS1w43i9tf6g=3D=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3AeUPAQBzGC7wd6iXXCy+O/D0hRQkC/pjqNwoI44?=
 =?us-ascii?q?YmjLQTLP3x4cG7bwTWsO92hRrSXYyBtqwXw+GDqa3kUHwN7dGbvXQLYJFABH?=
 =?us-ascii?q?pnwY1e10RoSIaJXEP1M/ruKSc6T4xZAVBi+H6/PBsweo62LxWa6jX67WsJFx?=
 =?us-ascii?q?PzOBAnKu3pF9zclcOyhfy1qZbYMR5Vjjiwaq8gKRittgzeu4wXjdlnI6c1jx?=
 =?us-ascii?q?XOpn9PZPlOgH9vQDDb1160ro/4tNYx6Sletugs8cVNSvf/fqE1CKJVFi8nNG?=
 =?us-ascii?q?Zn78rtqRTFUU6D52AEVX4XjhtPBVrE6lTgU4/1o27msbhgwySAeMT5QLYoCl?=
 =?us-ascii?q?HAp+8jAFegwG8NN2sQ61vFtIt9iPJp/g+nvz9a/Lfke9Cbav0iYqDSYPErSX?=
 =?us-ascii?q?VDZsIODglTD6TgOthqbaJJda4Q58G1rQ4Ah0KgKir0NbPO6zlYqHjQ3KsQ6u?=
 =?us-ascii?q?B5LF+d4hYmWMkhmm+E8+zfbakyVcm85fT07TPpcM1L82qntYzoLUk6msuVYo?=
 =?us-ascii?q?gVE4KZgQFnX0uNxgqN8KKmYxm60NQiq1a39do/f+et0XME9wFXiAC92eYDhI?=
 =?us-ascii?q?bqi4w1xWiUrhw+mKY3YtOISmtBWNSrQZV2hSybK7ZkfNMBJgMg8G5ygvVO8d?=
 =?us-ascii?q?aFZ2sb1ZQ7yTL/Neaqd5WG3DvedPjLIGtRlH9cO4rj2guOzlmRn760Roy1yl?=
 =?us-ascii?q?FMti1fjpzWu2sQ0wCG6sGdRvV0/0PykSbK1hrU7PlDO1xxmLDBLIR02b8/kJ?=
 =?us-ascii?q?MPrF7OViP3lA3wi7PeaEg+++a5o9fpY7PvoqrPbdUmoxziMqkohs20CPg5NQ?=
 =?us-ascii?q?5LZWWA5OCgz+2/r0jpBr5Nivosm6Xe9p3WOJdTqq24BlpV25wv5R++C3/my9?=
 =?us-ascii?q?UXm3AbMUhIMB6Gg8DvPE2GPv3iDPmuy2eikTFiw8WHdr3sC5nAND7CxZ/vc6?=
 =?us-ascii?q?l57whXyAc=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0GcAABLGZ5dYU1DioBlGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBEQEBAQEBAQEBAQEBTYEughsFJAJGgQUqjSWFWoIPmxkWAQE?=
 =?us-ascii?q?BAQEBAQEBBgEBGAMSAgEBAYFLhUYjOBMCAQEBCQEBAQMBAQECAQUCAQECAgM?=
 =?us-ascii?q?YFgaFXwyEBAEBAQEBAQEBASMqAg1UYwEBAQECAQECDxUTBgEBNwEFCQEBChQ?=
 =?us-ascii?q?ECRMSAwwFIAEFASITBR2DAAGCVyAEo3OBAzyKMYF0M4J+AYV7V2gJEg6BFIp?=
 =?us-ascii?q?xgR0YgX+BEYFwdC4+aYlHBI80hi2XWAqBRWdqhh6OBQwbdYFFcopPOYsMhDe?=
 =?us-ascii?q?jLAIKBwYPI4FGgXszGggwgycJRxAUgU8JAxeDKIp9QTGBCI1BK4InAQE?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0E5AABiEp5dh0O0hNFlGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBEQEBAQEBAQEBAQEBTYEughtwVDEqjSWFWYIPFJsFFgEBAQE?=
 =?us-ascii?q?BAQEBAQYBARgDEQECAQEBgUuFRiM4EwIBAQEJAQEBAwEBAQIBBQIBAQICEAE?=
 =?us-ascii?q?BAQoLCQgphTQMhAQBAQEBAQEBAQEjKgINVGMBAQEBAgEBAg8VEwYBATcBBQk?=
 =?us-ascii?q?BAQoUBAkTEgMMBSABBQEiEwUdgwABgXsPBKN6gQM8ijGBdDOCfgGFe1doCRK?=
 =?us-ascii?q?BIopxgR0YgX+BEYFwdC4+aYlBBI80hi2XWAqBRWdqhh6OBQwbdYFFcopPOYs?=
 =?us-ascii?q?MhDejLAIKBwYPI4FGgXszGggwgycJRxAUgU8JAxeDKIp9QDKBBgEBkQsrgic?=
 =?us-ascii?q?BAQ?=
X-IPAS-Result: =?us-ascii?q?A0GcAABLGZ5dYU1DioBlGQEBAQEBAQEBAQEBAQEBAQEBE?=
 =?us-ascii?q?QEBAQEBAQEBAQEBTYEughsFJAJGgQUqjSWFWoIPmxkWAQEBAQEBAQEBBgEBG?=
 =?us-ascii?q?AMSAgEBAYFLhUYjOBMCAQEBCQEBAQMBAQECAQUCAQECAgMYFgaFXwyEBAEBA?=
 =?us-ascii?q?QEBAQEBASMqAg1UYwEBAQECAQECDxUTBgEBNwEFCQEBChQECRMSAwwFIAEFA?=
 =?us-ascii?q?SITBR2DAAGCVyAEo3OBAzyKMYF0M4J+AYV7V2gJEg6BFIpxgR0YgX+BEYFwd?=
 =?us-ascii?q?C4+aYlHBI80hi2XWAqBRWdqhh6OBQwbdYFFcopPOYsMhDejLAIKBwYPI4FGg?=
 =?us-ascii?q?XszGggwgycJRxAUgU8JAxeDKIp9QTGBCI1BK4InAQE?=
X-IPAS-Result: =?us-ascii?q?A0E5AABiEp5dh0O0hNFlGQEBAQEBAQEBAQEBAQEBAQEBE?=
 =?us-ascii?q?QEBAQEBAQEBAQEBTYEughtwVDEqjSWFWYIPFJsFFgEBAQEBAQEBAQYBARgDE?=
 =?us-ascii?q?QECAQEBgUuFRiM4EwIBAQEJAQEBAwEBAQIBBQIBAQICEAEBAQoLCQgphTQMh?=
 =?us-ascii?q?AQBAQEBAQEBAQEjKgINVGMBAQEBAgEBAg8VEwYBATcBBQkBAQoUBAkTEgMMB?=
 =?us-ascii?q?SABBQEiEwUdgwABgXsPBKN6gQM8ijGBdDOCfgGFe1doCRKBIopxgR0YgX+BE?=
 =?us-ascii?q?YFwdC4+aYlBBI80hi2XWAqBRWdqhh6OBQwbdYFFcopPOYsMhDejLAIKBwYPI?=
 =?us-ascii?q?4FGgXszGggwgycJRxAUgU8JAxeDKIp9QDKBBgEBkQsrgicBAQ?=
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="scan'208"; a="369345668"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="369274005"
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-Original-Recipients: migi9492@g.colorado.edu
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20161025; 
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id        
 :mail-followup-to:references:mime-version:content-disposition        
 :in-reply-to:user-agent;       
 bh=AsRzV/el8Z6unpKMWQXs9f6o4tkguJYdwjPl71MzeO4=;       
 b=UVNbnBinAhyQbwBDQJM4AA2ddt/tH01/Y7AahQzFCcS7oC+zTuTh0sPkpODsqGtno/        
 qSaNRHzKdyzUPc2LynwPV/1goXIqB6UDfsZYqlJpgCAjRfto8s69oR4HA912zo4yhRBN        
 8KLJJfJFoRmuAV4cBKmNt0Qb+Zkuv3uxGNj/mgeJsTWJyk7hmg/Of89QeLH01xdOZpXc        
 2n6xy4Rzn/TajjBrYiFbZUJTozrPgIJTz+UhwN4DFzp5AZnvpBKCvyJaulJAXotiQPV0        
 lARWocny6v/1vR8urfu+B/k02/rV2mvhEN/fKDBVzPlSgl2OBq6dBMrKXAgk78N1nFm6        
 tBOg==
X-Gm-Message-State: APjAAAXHTip2i01sRBhinv2kA+jjYRqsOELoejPgZx2HoMZQ1zMbtvEV 
 5wNl0jDXo6DszyENh9vQaaPGNw==
X-Google-Smtp-Source: APXvYqzwQw06TGxsSqHcjDC/wNFmpzXbSCEbJZ3820d/3Ps2IPTfJXCgo1jOu1txUjeab2Rpd2iaBQ==
X-Received: by 2002:a17:907:4150:: with SMTP id
 od24mr3627781ejb.135.1570638758954; 
 Wed, 09 Oct 2019 09:32:38 -0700 (PDT)
Date: Wed, 9 Oct 2019 18:32:35 +0200
From: "Daniel Vetter" <daniel@ffwll.ch>
To: "Colin Ian King" <colin.king@canonical.com>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
Message-ID: <20191009163235.GT16989@phenom.ffwll.local>
Mail-Followup-To: Colin Ian King <colin.king@canonical.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>,        Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,        "David
 (ChunMing) Zhou" <David1.Zhou@amd.com>,        David Airlie
 <airlied@linux.ie>,        amd-gfx mailing list
 <amd-gfx@lists.freedesktop.org>,        "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,        Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>,        "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 17:44:03.3424 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 817e3b80-c52e-4e95-f383-08d74ce04661
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.67.74; IPV:CAL; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:BL0PR03MB4051; H:ipmx3.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: BY2NAM01FT014.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 817e3b80-c52e-4e95-f383-08d74ce04661
X-MS-TrafficTypeDiagnostic: BL0PR03MB4051:|BL0PR03MB4051:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 17:44:03.0732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 817e3b80-c52e-4e95-f383-08d74ce04661
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.67.74];
 Helo=[ipmx3.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4051
X-MS-Exchange-Transport-EndToEndLatency: 02:22:11.7418452
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QpFKlUYvbNzJ61bXJRi+tYqoqT24575ajEywUQnzY/J3BuivTAbPODJjuiun?=
 =?us-ascii?Q?baYLrz8ECLugfLh+GyMc1u5NhK+JI4Cww5I75qMFpcTVXb7ZANPGbSg4iaZI?=
 =?us-ascii?Q?HbG0H8gl1KEjb+ntFHLNfKO3/fVA4SJZC7HgRET/4X3ajrJfROJSkSBBRp9H?=
 =?us-ascii?Q?uOB+FFMitGtpk5c+AyBjYwtkjRKoO82Bqj2SG0J83svC7nIUhSXqTfprar+e?=
 =?us-ascii?Q?uAC4DiX+7mB6h6r2hurfxzKRn5QDG5ACpCngPLLH4IP16cgW/ETqhJEqT2qa?=
 =?us-ascii?Q?JHhUU0dFpX7n6jLaeeQp89j/jo5ddkm+u/lnILR8Aa2PwjYe0cUw7zsRC1rP?=
 =?us-ascii?Q?RlVRKlqqR3JMwSDh2s/0egxNlUr9luZRR0tjjWbR9pcfMmejSfxIiMDUPH6p?=
 =?us-ascii?Q?NEeYUGnVe6eK5/xggmKx5B4LdZLGzX+0/j4TwDFIq5ACqnXBQgTkTTMNeiba?=
 =?us-ascii?Q?vO+7CyBCt1BTIeat8WxLizGBVq2GZ/4JyXjH4ZqOLc3Kc1i2Jb8uFbWaGI+W?=
 =?us-ascii?Q?ft8c4ymX0S1UaIbZKBwoJb0+H5knCWQy3Ez2c462qbURLQb/KCP4tjXDpARG?=
 =?us-ascii?Q?v/Fq/VqoeZHqgM+nEA/dyy3aQ+2pLY+dIs3TMTm7rfYJgS4TH/DSAShiHopj?=
 =?us-ascii?Q?AzX5KlkXAF9OXjvbFeqMS9PuXwlloqtlzB3FAA+G9z8icZYHyPVwznJzLS95?=
 =?us-ascii?Q?r6nXG6ZGTkVACdW28VO2eKWgDv9flT3zbR26p8RVheWDVW74jSJnPMEuDpRv?=
 =?us-ascii?Q?31nUeenFmMGTsWNbgPdvulM5GM8Ev8614eSa4zmbEd2MgpVPAY7JEfl3lbaK?=
 =?us-ascii?Q?scyuf8dgmBaIW9AXlPcjxu+MMR4Z/gQGxnd+N2mxZE/cLz0kEKZjwE1do8E/?=
 =?us-ascii?Q?/HldThcQ16WBfdDCdW24z0gJejuGL/1Gct4shOvlQ7iSPOSq+Zg5h+DyJTSH?=
 =?us-ascii?Q?mRkilXxL8g+eJwKhwheUC2Nq6e6qYSF5fXLRDQhv0N2M1xQSNJByCQpuy2jp?=
 =?us-ascii?Q?GIIdxhBW7FeK0+m5ZpWjD1H3OyyLSakO9sWpPYjGB/z+tyejiIOsWuT0K10z?=
 =?us-ascii?Q?lNQj7RQBrdPGaTIQUnxu8fc4VOr/2MxHPtMBhtigxN3xivvjzQSAqcHMDfDX?=
 =?us-ascii?Q?dHjYnE0APeAHfmz/gEYWvnMyBWGWpqUFa+oAHuh5HSaCfT8lpNHcRRAeGb5A?=
 =?us-ascii?Q?EJFOImoe2FjXiuq3nTnzeDp2eMr+zuHKBffkCmX2X5FcCINL5zpZ06PxeclE?=
 =?us-ascii?Q?Ot3an2JgAqtxBH4DBaSO?=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; 
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to        
 :references:mime-version:content-disposition:in-reply-to:user-agent;       
 bh=AsRzV/el8Z6unpKMWQXs9f6o4tkguJYdwjPl71MzeO4=;       
 b=fB1vGK0Y8IInxFoNinBQl0U63Vrn/sGBs87QB1fHlAaA5THnBwVuB525lH71sSRqWR        
 7u1F+4BGnXGpVDrX7Bmj2uK4hNBPzwIGfgKefHgP83Q/0Hj/fXjMRQbg9fNZeitUzVxK        
 Vs+yuhtfDH6rElufVAUHv2i4AxeQ+P45uTWyY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 128.138.67.74) smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=fail (signature did not verify)
 header.d=ffwll.ch;o365.colorado.edu; dmarc=none action=none
 header.from=ffwll.ch;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMTE6MDg6MDNQTSArMDEwMCwgQ29saW4gSWFuIEtpbmcg
d3JvdGU6Cj4gSGksCj4gCj4gU3RhdGljIGFuYWx5c2lzIHdpdGggQ292ZXJpdHkgaGFzIGRldGVj
dGVkIGEgcG90ZW50aWFsIGlzc3VlIHdpdGgKPiBmdW5jdGlvbiB2YWxpZGF0ZV9ia3N2IGluCj4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwMV9leGVjdXRpb24u
YyB3aXRoIHJlY2VudAo+IGNvbW1pdDoKPiAKPiBjb21taXQgZWQ5ZDhlMmJjYjAwM2VjOTQ2NThj
YWZlOWIxYmIzOTYwZTIxMzllYwo+IEF1dGhvcjogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnBy
ZWV0Lkxha2hhQGFtZC5jb20+Cj4gRGF0ZTogICBUdWUgQXVnIDYgMTc6NTI6MDEgMjAxOSAtMDQw
MAo+IAo+ICAgICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCBIRENQIG1vZHVsZQoKSSB0aGluayB0aGUg
cmVhbCBxdWVzdGlvbiBoZXJlIGlzIC4uLiB3aHkgaXMgdGhpcyBub3QgdXNpbmcgZHJtX2hkY3A/
Ci1EYW5pZWwKCj4gCj4gCj4gVGhlIGFuYWx5c2lzIGlzIGFzIGZvbGxvd3M6Cj4gCj4gIDI4IHN0
YXRpYyBpbmxpbmUgZW51bSBtb2RfaGRjcF9zdGF0dXMgdmFsaWRhdGVfYmtzdihzdHJ1Y3QgbW9k
X2hkY3AgKmhkY3ApCj4gIDI5IHsKPiAKPiBDSUQgODk4NTIgKCMxIG9mIDEpOiBPdXQtb2YtYm91
bmRzIHJlYWQgKE9WRVJSVU4pCj4gCj4gMS4gb3ZlcnJ1bi1sb2NhbDoKPiBPdmVycnVubmluZyBh
cnJheSBvZiA1IGJ5dGVzIGF0IGJ5dGUgb2Zmc2V0IDcgYnkgZGVyZWZlcmVuY2luZyBwb2ludGVy
Cj4gKHVpbnQ2NF90ICopaGRjcC0+YXV0aC5tc2cuaGRjcDEuYmtzdi4KPiAKPiAgMzAgICAgICAg
IHVpbnQ2NF90IG4gPSAqKHVpbnQ2NF90ICopaGRjcC0+YXV0aC5tc2cuaGRjcDEuYmtzdjsKPiAg
MzEgICAgICAgIHVpbnQ4X3QgY291bnQgPSAwOwo+ICAzMgo+ICAzMyAgICAgICAgd2hpbGUgKG4p
IHsKPiAgMzQgICAgICAgICAgICAgICAgY291bnQrKzsKPiAgMzUgICAgICAgICAgICAgICAgbiAm
PSAobiAtIDEpOwo+ICAzNiAgICAgICAgfQo+IAo+IGhkY3AtPmF1dGgubXNnLmhkY3AxLmJrc3Yg
aXMgYW4gYXJyYXkgb2YgNSB1aW50OF90IGFzIGRlZmluZWQgaW4KPiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AuaCBhcyBmb2xsb3dzOgo+IAo+IHN0cnVjdCBt
b2RfaGRjcF9tZXNzYWdlX2hkY3AxIHsKPiAgICAgICAgIHVpbnQ4X3QgICAgICAgICBhbls4XTsK
PiAgICAgICAgIHVpbnQ4X3QgICAgICAgICBha3N2WzVdOwo+ICAgICAgICAgdWludDhfdCAgICAg
ICAgIGFpbmZvOwo+ICAgICAgICAgdWludDhfdCAgICAgICAgIGJrc3ZbNV07Cj4gICAgICAgICB1
aW50MTZfdCAgICAgICAgcjBwOwo+ICAgICAgICAgdWludDhfdCAgICAgICAgIGJjYXBzOwo+ICAg
ICAgICAgdWludDE2X3QgICAgICAgIGJzdGF0dXM7Cj4gICAgICAgICB1aW50OF90ICAgICAgICAg
a3N2bGlzdFs2MzVdOwo+ICAgICAgICAgdWludDE2X3QgICAgICAgIGtzdmxpc3Rfc2l6ZTsKPiAg
ICAgICAgIHVpbnQ4X3QgICAgICAgICB2cFsyMF07Cj4gCj4gICAgICAgICB1aW50MTZfdCAgICAg
ICAgYmluZm9fZHA7Cj4gfTsKPiAKPiB2YXJpYWJsZSBuIGlzIGdvaW5nIHRvIGNvbnRhaW4gdGhl
IGNvbnRhaW5zIG9mIHIwcCBhbmQgYmNhcHMuIEknbSBub3QKPiBzdXJlIGlmIHRoYXQgaXMgaW50
ZW50aW9uYWwuIElmIG5vdCwgdGhlbiB0aGUgY291bnQgaXMgZ29pbmcgdG8gYmUKPiBpbmNvcnJl
Y3QgaWYgdGhlc2UgYXJlIG5vbi16ZXJvLgo+IAo+IENvbGluCgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
