Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0522F3EAF85
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 07:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D328D6E4BB;
	Fri, 13 Aug 2021 05:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F416E4BA;
 Fri, 13 Aug 2021 05:10:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVxIc3VNodNGECh4wA3bj7ssn4J8DBAJG+qBt2eO5CQ4ETN/N8HTjN3aojJBxs2NTMrfnHbm+R5rdVqntGF6UZI0NlfH1L/bjOWu3YWCyLxJMGvgH9PdQtb5UIyf9J0MwGurS0ec2ihDS3MYCLYeZAIkvWgty4cIKjdMvB1WA3Xu20jNQ/r5SO1uhAwdU6aA+5K6HWvjDG7pYSmc6rkLJop/x9lpQ9FZs5mnf5w7QE2fJlmD2orhpqr59wgP6tTmT4t0LZ3cMGjW9o2pKGaIhPz+HCLWFTynbO3v7t8JmeeGhmxrSbe4YC5egn1ybTkToIg1JyD8JjJ8aDFaE0vhHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HBx+4whp7jAEseNZ3Ys/qZOwJLkiZCvwuE5Vluayhs=;
 b=Vix9ORGsDXrozEsYd5ocuwb3SrOByojUK3TOa2zApo/BQ8xXeuV1ZW161PmPfRxybrOZg7vo7s8dNWZwnxzkIvEjdApsXLF4nejtauLeVBfPj/+Hn086yufm1avTtndEQQkVKjeBBe2wpL4UfhCMgaOlTrMSrS7I1iv7n7+DTEBj3O5hhm/FsyF5Fw/kx3QpnhzxPDQg8nf2DmzJQ10ou4SakucJlkcsJukD1iE0/s0t5CBWOtacM7vLoYm+FFNrw9LDkyn7XtnhH+WryJDKCamcOBhkz3kkIvSY5z9OyN1qX57f4TZkvr4Zmzf26WVxB7szVJc3YyqC9fLyzdoHZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HBx+4whp7jAEseNZ3Ys/qZOwJLkiZCvwuE5Vluayhs=;
 b=xKyYmRm0KtqD7OnCARzOUdQC3L7Ab3X8f6LvWs4n3muUnIIkOl30+gFoegZXkTxR9M7nQUaO1ngM/5InjQz7P7krg5BqSzO2y87YXn6XJrop+zMepGHPIjWnpxG5vLa/LMRdAUDFnUl/xYdSzdHTnkIDU8XT1jOiXSvRXEqL2bQ=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM6PR12MB5520.namprd12.prod.outlook.com (2603:10b6:5:208::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Fri, 13 Aug
 2021 05:10:37 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::946e:7191:34a2:9850]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::946e:7191:34a2:9850%7]) with mapi id 15.20.4415.015; Fri, 13 Aug 2021
 05:10:37 +0000
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
To: Brian Starkey <brian.starkey@arm.com>,
 Harry Wentland <harry.wentland@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ppaalanen@gmail.com, sebastian@sebastianwick.net, mcasas@google.com,
 jshargo@google.com, Deepak.Sharma@amd.com, Shirish.S@amd.com,
 Vitaly.Prosyak@amd.com, aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com, nd@arm.com,
 uma.shankar@intel.com
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210802163042.2phdkytybie236x4@000377403353>
From: "Sharma, Shashank" <shashank.sharma@amd.com>
Message-ID: <4e13504d-20ec-ae9c-7cb0-f79376d0f98b@amd.com>
Date: Fri, 13 Aug 2021 10:42:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210802163042.2phdkytybie236x4@000377403353>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::16) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.89.110] (165.204.159.242) by
 PN0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:49::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.15 via Frontend Transport; Fri, 13 Aug 2021 05:10:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5821a155-ed2a-4fd9-12be-08d95e18af83
X-MS-TrafficTypeDiagnostic: DM6PR12MB5520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB55209AC3B60A1399EA54CF1EF2FA9@DM6PR12MB5520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbf3D3/lPbG/8J9MICaTGnWCfL37Jgi1Cz5df3s8lTI44zHZAOJtdRLBlvPnGwquH0s0sQIV7mY86LDvIPvqOIHFO3JZk+9eY3X3SHihDXRIJYc0iJ/xPi6lSt/nKlmNviyRk7gXuwvji9iPOKx+yWI2tEtgfn8yVm/q6CoDHyUKm+SodSbShlvWVzz95yXuAGVh+DkNTlPRz+zOz5lqm7gnJ0bINqeT5UIVtMYLlQs42h4n3HNNYTkQycWdc+fKiED/LrCjeVfwB8EyXgQR4VSk1ba7zhx3QxTVELmbmt6lsUuM2yTvZlFYEmx+0NPngglTuKcuhJWHUsveuTn3rVO6pBaiye+IYFJrtfG1ri63/G2VkP8DaVn30KLR3TrpjZcbVC0JAWaFC20zFHsO1LjgcP9h8nnzJC14g7WrwqRp/n4mK0RqfKKkskrK7WEppBsSSgU6fyC8M4FH2ra+a5K7Tkd4r+vMRX8bZ/fLclLwBv4WgOntk1P0S2e/qiEuybYbP2KcCKdv1MY6yqgLVaAd8COW6DXbGY8GiZFfpFcb1AfrdRimQgSmU2IJA0etLt6P6HbQI9NRP2SBEBmJyywvfJ3rI21DGFpcrCwSjHZotAVm9bgPS+cU5BwY81y+nLtmXMJVcL7M5DyY2z6iO2e6A6cVIMCfEpFlVFy3QNKYzrzF/OJ4UEPrjmxZCHkKAL6nZQ4Ks6NKXP9IYq+1esBu9en75gyn7ki3vv97LlXnEFdueHraI/Aqow2lfwyDpglbmOzgCeql3ebZAL9w9bNGqOqYxMoAxaJMitj3hb9FP+ccUYS89zrI5P1/JbI5ZnGj+Wdbk79samVqUYs6HeJKsYPSQOfQvyobrBhZZQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5040.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(956004)(5660300002)(6666004)(66476007)(8676002)(66556008)(86362001)(478600001)(2616005)(6486002)(83380400001)(66946007)(110136005)(45080400002)(53546011)(8936002)(6636002)(4326008)(36756003)(31686004)(966005)(316002)(7416002)(2906002)(31696002)(16576012)(38100700002)(26005)(30864003)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STViaHJuclNhUG1XUHhTRGd3b1liZFlFalpEU1htbFFsQnZTVXMySGYwTzRr?=
 =?utf-8?B?OEp2VzVZdS9PYVhEMjRmelR0dGgrWTlVMDA0b2VyaE4rTFNXMXZqWkVRSjFh?=
 =?utf-8?B?TUhXMDBpUSs2d255M3hTaVFTVmZKQkU1ckU5RC9sd2VHNDU2YnFrTUtidk81?=
 =?utf-8?B?cC9ONzdnVDFXM0JUNHgrdVArWWszdER6UGFmcWhnSXdJUGlYUnk3UDM1QlFD?=
 =?utf-8?B?UzJKZ056VUw5THFpWGZNaXNwNCt0ejNnTHZ2ZkYzOWgzaVFHV3hzdHY1dHNV?=
 =?utf-8?B?eDluZkppcHJDVlltWlUwR24yKzdlUHBQdDN2WXF5a1YrdldZOEtYUlp0aHNp?=
 =?utf-8?B?WXBqOFNETmtqUzE1Wm52c0dLWlg1Ti82YWZjbmdMdG1EN1Z1dWJ4Q1JGbGhQ?=
 =?utf-8?B?cG9uV1EwNEl4WXFicm5JRWwvTnUyUm1FMHN4QUo1K1N0MFBhZU5IZ2ZzbGls?=
 =?utf-8?B?WWZ0bU94alZwdkFtSFljL3ZqNkxXcjdhN3B2YXNEK2NXblpwR0h3OVNDRlFq?=
 =?utf-8?B?MGt0Ry8vK0lHOEpWTmF5QS9lNW92MGpwZ29jLytlSnFZS1AzYWd6U0JZc21s?=
 =?utf-8?B?N0JsMC9ISng5amwrWmRpUGJsOE1TQVNrUGU1VEw5aVd4TWQ0cGZkY2VJL3JK?=
 =?utf-8?B?d2ZFU1M2bUV0ZkJuUTg5RjI0SzBjazZWL0xwM0Y2T212WC9GRlVQQTgxQjEw?=
 =?utf-8?B?b0ZGbWgxSXg0SXllc0hCYXhmMExsSXRXUnd1UXIzR2wyMisxYm1qbTZ6aHVF?=
 =?utf-8?B?Vy9SWVRNdkxSTHpYS1FUWldxcVJEOGpuY05IL0NJZEk0Q2wrTGNOK25ueDhU?=
 =?utf-8?B?UnRmR3RHNk9VOUlJQXYzdElnU2dEMlk1ODIwQWdBTTZwUmJZVmpHZzJnb2lj?=
 =?utf-8?B?eDFjV0pySGgxT2EydUdGVVlUN1huRXA0UmpCRWVtakhUVElWT1o3RlBxSGZp?=
 =?utf-8?B?ajVuYThOVy9aMkZ0cnVKNkZyRUxSeXZtKzJvcUlPWXAvdnZ6RGZna3B6eFhW?=
 =?utf-8?B?eFAvUytiVm5LcjFwbkNkU3UrbmNBcHd4UkI0ZHV3bUZEN1JsS0pxclhtV0FL?=
 =?utf-8?B?dzBIb05kTzZScjRoOUxneTVhRVp5TEZWTFV1cm52MWdITUtnN3BXREozRGoy?=
 =?utf-8?B?OW1ZejRBSm9lQnlxVFROU1JNK1NJL1BWS1pEejlmVU92Y0tETnJYVGJyNWp4?=
 =?utf-8?B?TkRrLys4NkROQ0VvV0paOWd4WXdnajhMc2ROdllDWVFxVjBSTXlsUXNYK2xR?=
 =?utf-8?B?V0l0YWpnejJnSlR4M0RNWWlNa2c2MXJIakovMXhpZGR4UlA3SW90NFNWMWdB?=
 =?utf-8?B?NXYybm0yd3BzZ1RsQjZMb1gxV3l5TnNHOHIzT0d3cUU3K2UvNzZnUGxmcEFk?=
 =?utf-8?B?bnBqaHNGRndubG8xTGc3N3pCdEdwdVBPcEIvdUNpbDlJUnhSZVk2OGFOSWxm?=
 =?utf-8?B?NHZtbzVRVVVqWE1FU0NReEhEMzNLNllEZ0FSeGo4VXdldkRCcXJUdzdQL25m?=
 =?utf-8?B?WWdwRFdPeW9Rckgxc2YyN2JPQXZqYlVOc0JqalZRWVBDQytCTnFpc3B4djQw?=
 =?utf-8?B?WllPcTZsMTZGRWttc0dOZnVGUzVLWTh3OXYwNFhkb09GdjA1azBjbmhYSFQw?=
 =?utf-8?B?OTdOeDgvZk5KQ2R6N1JQb3IydmlyL0F0REh5cVZodDQrOXZHR3ZrK1BFMmxp?=
 =?utf-8?B?WDZPb25YdjVKSGFES0ZyQ1BWdDJFekJuMTl4SjZ5QUhSOC9pK211YlFzQm1K?=
 =?utf-8?Q?rgDcgr3vOSVMAQlV+MRrlMwz1oxEKVo0LvpY7Vn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5821a155-ed2a-4fd9-12be-08d95e18af83
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 05:10:37.1303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2Gwq/ygGOBbcpFdLAsFym3PI8ELH89q+qP+HdUpDkMakzyMR9RVi2xIB3I4iAyeoNpGNplDDoCfQzkKrcuYTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5520
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

Hello Brian,
(+Uma in cc)

Thanks for your comments, Let me try to fill-in for Harry to keep the 
design discussion going. Please find my comments inline.

On 8/2/2021 10:00 PM, Brian Starkey wrote:
> Hi,
> 
> Thanks for having a stab at this, it's a massive complex topic to
> solve.
> 
> Do you have the the HTML rendered somewhere for convenience?
> 
> On Fri, Jul 30, 2021 at 04:41:29PM -0400, Harry Wentland wrote:
>> Use the new DRM RFC doc section to capture the RFC previously only
>> described in the cover letter at
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F89506%2F&amp;data=04%7C01%7CShashank.Sharma%40amd.com%7C42a8172c947b41c17a5c08d955d2e859%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637635186605487756%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=DAoEKo7fl83YPgqFvEGCHF2vyYfILfoLBCCu5Q2Lg88%3D&amp;reserved=0
>>
>> v3:
>>   * Add sections on single-plane and multi-plane HDR
>>   * Describe approach to define HW details vs approach to define SW intentions
>>   * Link Jeremy Cline's excellent HDR summaries
>>   * Outline intention behind overly verbose doc
>>   * Describe FP16 use-case
>>   * Clean up links
>>
>> v2: create this doc
>>
>> v1: n/a
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   Documentation/gpu/rfc/color_intentions.drawio |   1 +
>>   Documentation/gpu/rfc/color_intentions.svg    |   3 +
>>   Documentation/gpu/rfc/colorpipe               |   1 +
>>   Documentation/gpu/rfc/colorpipe.svg           |   3 +
>>   Documentation/gpu/rfc/hdr-wide-gamut.rst      | 580 ++++++++++++++++++
>>   Documentation/gpu/rfc/index.rst               |   1 +
>>   6 files changed, 589 insertions(+)
>>   create mode 100644 Documentation/gpu/rfc/color_intentions.drawio
>>   create mode 100644 Documentation/gpu/rfc/color_intentions.svg
>>   create mode 100644 Documentation/gpu/rfc/colorpipe
>>   create mode 100644 Documentation/gpu/rfc/colorpipe.svg
>>   create mode 100644 Documentation/gpu/rfc/hdr-wide-gamut.rst
>>
> 
> -- snip --
> 
>> +
>> +Mastering Luminances
>> +--------------------
>> +
>> +Even though we are able to describe the absolute luminance of a pixel
>> +using the PQ 2084 EOTF we are presented with physical limitations of the
>> +display technologies on the market today. Here are a few examples of
>> +luminance ranges of displays.
>> +
>> +.. flat-table::
>> +   :header-rows: 1
>> +
>> +   * - Display
>> +     - Luminance range in nits
>> +
>> +   *  - Typical PC display
>> +      - 0.3 - 200
>> +
>> +   *  - Excellent LCD HDTV
>> +      - 0.3 - 400
>> +
>> +   *  - HDR LCD w/ local dimming
>> +      - 0.05 - 1,500
>> +
>> +Since no display can currently show the full 0.0005 to 10,000 nits
>> +luminance range of PQ the display will need to tone-map the HDR content,
>> +i.e to fit the content within a display's capabilities. To assist
>> +with tone-mapping HDR content is usually accompanied by a metadata
>> +that describes (among other things) the minimum and maximum mastering
>> +luminance, i.e. the maximum and minimum luminance of the display that
>> +was used to master the HDR content.
>> +
>> +The HDR metadata is currently defined on the drm_connector via the
>> +hdr_output_metadata blob property.
>> +
>> +It might be useful to define per-plane hdr metadata, as different planes
>> +might have been mastered differently.
> 
> I think this only applies to the approach where all the processing is
> decided in the kernel right?
> 
> If we directly expose each pipeline stage, and userspace controls
> everything, there's no need for the kernel to know the mastering
> luminance of any of the input content. The kernel would only need to
> know the eventual *output* luminance range, which might not even match
> any of the input content!
> 
> 
Yes, you are right. In an approach where a compositor controls 
everything, we might not need this property, as the compositor can 
directly prepare the color correction pipeline with the required 
matrices and kernel can just follow it.

The reason why we introduced this property here is that there may be a 
hardware which implements a fixed function degamma HW unit or tone 
mapping unit, and this property might make it easier for their drivers 
to implement.

So the whole idea was to plan a seed for thoughts for those drivers, and 
see if it makes sense to have such a property.

> ...
> 
>> +
>> +How are we solving the problem?
>> +===============================
>> +
>> +Single-plane
>> +------------
>> +
>> +If a single drm_plane is used no further work is required. The compositor
>> +will provide one HDR plane alongside a drm_connector's hdr_output_metadata
>> +and the display HW will output this plane without further processing if
>> +no CRTC LUTs are provided.
>> +
>> +If desired a compositor can use the CRTC LUTs for HDR content but without
>> +support for PWL or multi-segmented LUTs the quality of the operation is
>> +expected to be subpar for HDR content.
>> +
>> +
>> +Multi-plane
>> +-----------
>> +
>> +In multi-plane configurations we need to solve the problem of blending
>> +HDR and SDR content. This blending should be done in linear space and
>> +therefore requires framebuffer data that is presented in linear space
>> +or a way to convert non-linear data to linear space. Additionally
>> +we need a way to define the luminance of any SDR content in relation
>> +to the HDR content.
>> +
> 
> Android doesn't blend in linear space, so any API shouldn't be built
> around an assumption of linear blending.
> 

If I am not wrong, we still need linear buffers for accurate Gamut 
transformation (SRGB -> BT2020 or other way around) isn't it ?

>> +In order to present framebuffer data in linear space without losing a
>> +lot of precision it needs to be presented using 16 bpc precision.
>> +
>> +
>> +Defining HW Details
>> +-------------------
>> +
>> +One way to take full advantage of modern HW's color pipelines is by
>> +defining a "generic" pipeline that matches all capable HW. Something
>> +like this, which I took `from Uma Shankar`_ and expanded on:
>> +
>> +.. _from Uma Shankar: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90826%2F&amp;data=04%7C01%7CShashank.Sharma%40amd.com%7C42a8172c947b41c17a5c08d955d2e859%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637635186605487756%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=krxqbMPxwiArlEeG7yLaFy6CMP%2BQnNNDSn%2B%2FxDWcfhM%3D&amp;reserved=0
>> +
>> +.. kernel-figure::  colorpipe.svg
> 
> I don't think this pipeline is expressive enough, in part because of
> Android's non-linear blending as I mentioned above, but also because
> the "tonemapping" block is a bit of a monolithic black-box.
> 
> I'd be in favour of splitting what you've called "Tonemapping" to
> separate luminance adjustment (I've seen that called OOTF) and
> pre-blending OETF (GAMMA); with similar post-blending as well:
> 
> Before blending:
> 
> FB --> YUV-to-RGB --> EOTF (DEGAMMA) --> CTM/CSC (and/or 3D LUT) --> OOTF --> OETF (GAMMA) --> To blending
> 
> After blending:
> 
>  From blending --> EOTF (DEGAMMA) --> CTM/CSC (and/or 3D LUT) --> OOTF --> OETF (GAMMA) --> RGB-to-YUV --> To cable
> 
> This separates the logical pipeline stages a bit better to me.

I agree, seems like a good logical separation, and also provides rooms 
for flexible color correction.
> 
>> +
>> +I intentionally put de-Gamma, and Gamma in parentheses in my graph
>> +as they describe the intention of the block but not necessarily a
>> +strict definition of how a userspace implementation is required to
>> +use them.
>> +
>> +De-Gamma and Gamma blocks are named LUT, but they could be non-programmable
>> +LUTs in some HW implementations with no programmable LUT available. See
>> +the definitions for AMD's `latest dGPU generation`_ as an example.
>> +
>> +.. _latest dGPU generation: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fstable%2Flinux.git%2Ftree%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Fdisplay%2Fdc%2Fdcn30%2Fdcn30_resource.c%3Fh%3Dv5.13%23n2586&amp;data=04%7C01%7CShashank.Sharma%40amd.com%7C42a8172c947b41c17a5c08d955d2e859%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637635186605487756%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2BBbp593GEp0zNwUqjjLWQ1KbnVHyvkRtQy%2FugIID6DY%3D&amp;reserved=0
>> +
>> +I renamed the "Plane Gamma LUT" and "CRTC De-Gamma LUT" to "Tonemapping"
>> +as we generally don't want to re-apply gamma before blending, or do
>> +de-gamma post blending. These blocks tend generally to be intended for
>> +tonemapping purposes.
> 
> Sorry for repeating myself (again) - but I don't think this is true in
> Android.
> 
Same as above

>> +
>> +Tonemapping in this case could be a simple nits value or `EDR`_ to describe
>> +how to scale the :ref:`SDR luminance`.
>> +
>> +Tonemapping could also include the ability to use a 3D LUT which might be
>> +accompanied by a 1D shaper LUT. The shaper LUT is required in order to
>> +ensure a 3D LUT with limited entries (e.g. 9x9x9, or 17x17x17) operates
>> +in perceptual (non-linear) space, so as to evenly spread the limited
>> +entries evenly across the perceived space.
> 
> Some terminology care may be needed here - up until this point, I
> think you've been talking about "tonemapping" being luminance
> adjustment, whereas I'd expect 3D LUTs to be used for gamut
> adjustment.
> 

IMO, what harry wants to say here is that, which HW block gets picked 
and how tone mapping is achieved can be a very driver/HW specific thing, 
where one driver can use a 1D/Fixed function block, whereas another one 
can choose more complex HW like a 3D LUT for the same.

DRM layer needs to define only the property to hook the API with core 
driver, and the driver can decide which HW to pick and configure for the 
activity. So when we have a tonemapping property, we might not have a 
separate 3D-LUT property, or the driver may fail the atomic_check() if 
both of them are programmed for different usages.

>> +
>> +.. _EDR: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fswick%2Fwayland-protocols%2F-%2Fblob%2Fcolor%2Funstable%2Fcolor-management%2Fcolor.rst%23id8&amp;data=04%7C01%7CShashank.Sharma%40amd.com%7C42a8172c947b41c17a5c08d955d2e859%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637635186605487756%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=LUKbk%2FJtJBj8D3BTi8K68lFWTDVuoUsoA4dDNkvt1o0%3D&amp;reserved=0
>> +
>> +Creating a model that is flexible enough to define color pipelines for
>> +a wide variety of HW is challenging, though not impossible. Implementing
>> +support for such a flexible definition in userspace, though, amounts
>> +to essentially writing color pipeline drivers for each HW.
>> +
> 
> Without this, it seems like it would be hard/impossible for a
> general-purpose compositor use the display hardware.
> 
Agree

> There will always be cases where compositing needs to fall back to a
> GPU pass instead of using HW. If userspace has no idea what the
> kernel/hardware is doing, it has no hope of matching the processing
> and there will be significant visual differences between the two
> paths.
> 
Indeed, I find this another interesting and complex problem to solve. 
Need many more inputs from compositor developers as well (considering I 
am not an actual one :)).

> This is perhaps less relevant for post-blending stuff, which I expect
> would be applied by HW in both cases.
> 
>> +
>> +Defining SW Intentions
>> +----------------------
>> +
>> +An alternative to describing the HW color pipeline in enough detail to
>> +be useful for color management and HDR purposes is to instead define
>> +SW intentions.
>> +
>> +.. kernel-figure::  color_intentions.svg
>> +
>> +This greatly simplifies the API and lets the driver do what a driver
>> +does best: figure out how to program the HW to achieve the desired
>> +effect.
>> +
>> +The above diagram could include white point, primaries, and maximum
>> +peak and average white levels in order to facilitate tone mapping.
>> +
>> +At this point I suggest to keep tonemapping (other than an SDR luminance
>> +adjustment) out of the current DRM/KMS API. Most HDR displays are capable
>> +of tonemapping. If for some reason tonemapping is still desired on
>> +a plane, a shader might be a better way of doing that instead of relying
>> +on display HW.
>> +
>> +In some ways this mirrors how various userspace APIs treat HDR:
>> + * Gstreamer's `GstVideoTransferFunction`_
>> + * EGL's `EGL_EXT_gl_colorspace_bt2020_pq`_ extension
>> + * Vulkan's `VkColorSpaceKHR`_
>> +
>> +.. _GstVideoTransferFunction: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgstreamer.freedesktop.org%2Fdocumentation%2Fvideo%2Fvideo-color.html%3Fgi-language%3Dc%23GstVideoTransferFunction&amp;data=04%7C01%7CShashank.Sharma%40amd.com%7C42a8172c947b41c17a5c08d955d2e859%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637635186605487756%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JKdpEZ4Pn2gjH0ABNO4S2cTwelmkYfPF59c93qu8Iuo%3D&amp;reserved=0
>> +.. _EGL_EXT_gl_colorspace_bt2020_pq: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.khronos.org%2Fregistry%2FEGL%2Fextensions%2FEXT%2FEGL_EXT_gl_colorspace_bt2020_linear.txt&amp;data=04%7C01%7CShashank.Sharma%40amd.com%7C42a8172c947b41c17a5c08d955d2e859%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637635186605487756%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=9hRRvJHfihS3UwitXRCXEZgc60HG4MK%2FFeuSJSva9vc%3D&amp;reserved=0
>> +.. _VkColorSpaceKHR: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.khronos.org%2Fregistry%2Fvulkan%2Fspecs%2F1.2-extensions%2Fhtml%2Fvkspec.html%23VkColorSpaceKHR&amp;data=04%7C01%7CShashank.Sharma%40amd.com%7C42a8172c947b41c17a5c08d955d2e859%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637635186605487756%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=hH9izNfEy4OK2QcYvnvEko62%2Fk1cTYXQOe1LC1AzbMI%3D&amp;reserved=0
>> +
> 
> These (at least the Khronos ones) are application-facing APIs, rather
> than APIs that a compositor would use. They only communicate content
> hints to "the platform" so that the compositor can do-the-right-thing.
> 
> I think that this enum approach makes sense for an app, but not for
> implementing a compositor, which would want direct, explicit control.
> 
Agree, we can fine tune this part and come back with something else.
>> +
>> +A hybrid approach to the API
>> +----------------------------
>> +
>> +Our current approach attempts a hybrid approach, defining API to specify
>> +input and output transfer functions, as well as an SDR boost, and a
>> +input color space definition.
>> +
>> +We would like to solicit feedback and encourage discussion around the
>> +merits and weaknesses of these approaches. This question is at the core
>> +of defining a good API and we'd like to get it right.
>> +
>> +
>> +Input and Output Transfer functions
>> +-----------------------------------
>> +
>> +We define an input transfer function on drm_plane to describe the
>> +transform from framebuffer to blending space.
>> +
>> +We define an output transfer function on drm_crtc to describe the
>> +transform from blending space to display space.
>> +
>> +The transfer function can be a pre-defined function, such as PQ EOTF, or
>> +a custom LUT. A driver will be able to specify support for specific
>> +transfer functions, including custom ones.
>> +
>> +Defining the transfer function in this way allows us to support in on HW
>> +that uses ROMs to support these transforms, as well as on HW that use
>> +LUT definitions that are complex and don't map easily onto a standard LUT
>> +definition.
>> +
>> +We will not define per-plane LUTs in this patchset as the scope of our
>> +current work only deals with pre-defined transfer functions. This API has
>> +the flexibility to add custom 1D or 3D LUTs at a later date.
>> +
>> +In order to support the existing 1D de-gamma and gamma LUTs on the drm_crtc
>> +we will include a "custom 1D" enum value to indicate that the custom gamma and
>> +de-gamma 1D LUTs should be used.
>> +
>> +Possible transfer functions:
>> +
>> +.. flat-table::
>> +   :header-rows: 1
>> +
>> +   * - Transfer Function
>> +     - Description
>> +
>> +   *  - Gamma 2.2
>> +      - a simple 2.2 gamma function
>> +
>> +   *  - sRGB
>> +      - 2.4 gamma with small initial linear section
>> +
>> +   *  - PQ 2084
>> +      - SMPTE ST 2084; used for HDR video and allows for up to 10,000 nit support
>> +
>> +   *  - Linear
>> +      - Linear relationship between pixel value and luminance value
>> +
>> +   *  - Custom 1D
>> +      - Custom 1D de-gamma and gamma LUTs; one LUT per color
>> +
>> +   *  - Custom 3D
>> +      - Custom 3D LUT (to be defined)
>> +
>> +
>> +Describing SDR Luminance
>> +------------------------------
>> +
>> +Since many displays do no correctly advertise the HDR white level we
>> +propose to define the SDR white level in nits.
>> +
>> +We define a new drm_plane property to specify the white level of an SDR
>> +plane.
>> +
>> +
>> +Defining the color space
>> +------------------------
>> +
>> +We propose to add a new color space property to drm_plane to define a
>> +plane's color space.
> 
> What is this used/useful for?
> 
>> +
>> +While some color space conversions can be performed with a simple color
>> +transformation matrix (CTM) others require a 3D LUT.
>> +
>> +
>> +Defining mastering color space and luminance
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +ToDo
> 
> I don't think this is necessary at all (in the kernel API) if we
> expose the full pipeline.

As you can observe, both colorspace and mastering luminance properties 
get introduced as a part of the hybrid approach, where the compositor 
need not to set the whole color pipeline for HDR blending, but can just 
set the target/current color space of a plane being flipped, and the 
driver can internally prepare the pipeline for blending.

This would be in order to reduce the complexity for compositor, and 
offload some work on driver. At the same time, I agree that it would be 
something difficult to design at first.

- Shashank
> 
> Cheers,
> -Brian
> 
