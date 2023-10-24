Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C887D5B8C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F71F10E0CC;
	Tue, 24 Oct 2023 19:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU002.outbound.protection.outlook.com
 (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681A410E0CC;
 Tue, 24 Oct 2023 19:34:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYyL1uY7CXQky9t1Wm17y0dCzudSAseqefgckZHKpor6zLd0WMMTHQl7KJM4wh7TuSc0MInmKjkgbVvYrWMIl4et8V2YHfXl/2DBK5NwdgenOOR/VIKT/RX5Vti0WTh+tKH3sFdw05lPRRdetUN5NH0oLUjr5MQ3dJRgWMHXhWlFWsJD0tqluaFfdAkbkx7cD7wr+VNlICEGJNCm6oGoDOJzWkAgKHvU7xvQ466hjknib4RpnekwZvoPPmS6o8/Vf7a/QsVpHO37wkq8dFlybtvDpt8mGbVJRSVP7wmI9MVcYvvbMh96kWCXKMQXoIOEA9XXzBy9vdfr88t/OLa//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/70ptZ+a9JAJEycnVsFuXOoNZ7sfmooWRy+93HWPLvs=;
 b=a+4Ko/mQ/2HqP2yNLVG6MZxh0grYugjeOpZGuErTSwQGhv37PWtJ9fbXql5dwxbs/JnkJPpPNLCx228SnVpY0qQElNNQYVzvxHpAIn3cOVCJnCMGWrAfD+ENFUpYcb1jJnJDytphA0QVRK08vpb9Fl/YVbPzKhEJ7ZGCkNi/qWI6u0emUpfrdJLA2SPxtMYbsvkmDmM18fpnn5XQKU1U4KSaca/yIgwWwGPMGgDB251nlWVDFAJZ77KHpd11k3NY9J6qOdQs7Eb896xvgTuVOXmQ/Vv4JWIJq9e0KGnz9vCWrAhnLstwVeuk0NoKz9WArn5lbamgmKef7snJOneKhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/70ptZ+a9JAJEycnVsFuXOoNZ7sfmooWRy+93HWPLvs=;
 b=oHF7Sn+GX2MXqy/j/qqXZuCQaOwLyh6IZ578Dh2r//PWJalUHzQuXzqoIIf6GLz3d5gNo8R5hHaHU/uHYN096SozdvKPit5wyVHlq3iF9nAeGlR3+IVS9Y3p4bLxICzMQ99K4/GaYXharkb46+zcins/Rn+UsCAcT1xnM1guGdY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from DM5PR05MB3371.namprd05.prod.outlook.com (2603:10b6:4:45::31) by
 SJ0PR05MB10000.namprd05.prod.outlook.com (2603:10b6:a03:448::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Tue, 24 Oct
 2023 19:34:28 +0000
Received: from DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::c785:be91:b91a:8459]) by DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::c785:be91:b91a:8459%3]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 19:34:28 +0000
Message-ID: <1bbee4ad-79fe-4968-0edc-3eee34ad5972@vmware.com>
Date: Tue, 24 Oct 2023 12:34:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 9/9] drm: Introduce documentation for hotspot properties
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Albert Esteve <aesteve@redhat.com>, qemu-devel@nongnu.org
References: <20231023074613.41327-1-aesteve@redhat.com>
 <20231023074613.41327-10-aesteve@redhat.com>
 <87h6mh10zg.fsf@minerva.mail-host-address-is-not-set>
From: Michael Banack <banackm@vmware.com>
In-Reply-To: <87h6mh10zg.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0030.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::43) To DM5PR05MB3371.namprd05.prod.outlook.com
 (2603:10b6:4:45::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR05MB3371:EE_|SJ0PR05MB10000:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f441e44-797e-4a12-c6a6-08dbd4c83c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6qt+fdIjbKC0DkyWj8UZKdCpqqiVhIzCyleryP+Nr7H52gra4pC7fi30W9ia8Ai/bkEm97RHmNn6usW1cBy9v2Xq9u/bXbRn6EKDlSxGaOHT17MRxCRbDHu+0Jmh2X8/HC4L+Q9c6HTf6kZJ8C05g1Fsvs3rrVyTqxSvmwjXkoWEHlLw5+uolLX7Ezj0zRWPdB4N6e4iYjvMYpl17YL/wKkDra7hc7gYw5yPD3c3YFnDq2imaBy+Dw6OwXWWJ1X+C/nKYIIa3PbN8xLRn3yGuzQWyfc/Ai0WQGhKBbcS5odcEjkQhx66gQX/M6z7XV5F1VevbvA/WQsT5VT2rFXgcfF20nZyqr/EEUb3hCv1K+ydetyzC2eXT/lAY6SyQGi/4CrUwPQdz2bp9zVH+pEGq0/GQmx2GHJBgrmwWtnWuoQ0ZVWqLEqf6/7xhWGlXLrxMKlQ17f61nF9pqNFuWnTlKpQYk89DQkOyr93k73fys66WEP9L/yPBbe/2+/8pZPxtxT8oOWGR3pTNXMTdMgKrv/PTV9YxZh97Uehu1OIBk7yKJkCJxL6AJCNVmW7knytVgIIZI95gQkBBtPMUhfjo33Lxh2kxRTizmigjhZwK5PhXQgwRVsWYrOl4ocCsYdUqB7Is/wyCCVex+tsqyhXzE/uPOpNmSsf1G664w7ZXQgLRk78DCsjZdnS6UHRtSD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR05MB3371.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(53546011)(2906002)(6512007)(41300700001)(2616005)(83380400001)(26005)(6506007)(54906003)(110136005)(6486002)(86362001)(31696002)(6666004)(66476007)(66556008)(38100700002)(66946007)(8936002)(8676002)(36756003)(5660300002)(316002)(478600001)(7416002)(4326008)(4744005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkJlN0RlYWxJNXZQU3VsVUpXZDBlSXhjeE41M2UyV3pVbHViK1k2VUpXVFgv?=
 =?utf-8?B?OXhtWUc5VVgrVGZJR2VEcTQ0cjJEVjluYkF0dWxPN3JpazlEazhoL1NNNVdC?=
 =?utf-8?B?NXRUTnZ6Z1FnQlVkQlJ0ZGVESGdQbWltU29FUXcwWHRQQUFTYUluRURNbmNa?=
 =?utf-8?B?SU9QM3ZYR0JpM2xZRExhaHc2MjZsbGlXUWp2UmRudk1na2JudTV3Mm9yUkJL?=
 =?utf-8?B?aTZ1YSt3V0pXVlhxRzhMZHh0dmhLSXJ1QXlwemN1OFNuU2luWjVJWnJZcmd4?=
 =?utf-8?B?cVBsd1NPVElGWVhRcDBoYVhSTkY1aldkbmlyVW9mU3NET3BPWWh4bTdPUHUy?=
 =?utf-8?B?M2ZQYnVZSDBvdStJZlJDaGJ2ajRCVzd1UXdJT2pDRGROYnBseGJCNG5mQjlZ?=
 =?utf-8?B?TEl5WUkwYmtiZGR2OFdkbkdCaG93enB5R2tZTEhXdWZtLzRqYm10Q0xBZEYy?=
 =?utf-8?B?cW0wekNkbHByZlY2NjdDQnJmbjBPdDRhZkpNeXZqd2JScm5pUlBaRVBJVEJ5?=
 =?utf-8?B?aWZDaHpFc3p4amFhV2hsYjFVUnRGdlpnRnk4Q3JnR1dFUE9IZ1NYZWMrTzln?=
 =?utf-8?B?eGJxV09vcXc3VWxLbjlndnlUaUp5dFlUM0ttU1NUakRPT0p4YWUzZDZuOGRV?=
 =?utf-8?B?azNYclowVDFWeS9ROGxCSmxLQTF1eFF1UDhUek9FUnM0L3JQckdoNzdVdUVq?=
 =?utf-8?B?eXREbWI5VUJMY09FVitwajhvcXQ4WUg4WXladEhseWx3TlJRdy9tQjQwcmU5?=
 =?utf-8?B?T3laVndtV3pBRFJoOUhFUWJZL2s2OHNlRmpNeVBjamxHZHZ4eisxV3BFeVlU?=
 =?utf-8?B?ajBib0ZVOGJLMVZ4eHhST2VWT250amFvOGJ1b0UwZVZwMnRUSTlnM1Aycndz?=
 =?utf-8?B?MGxvSXVOem5zR2FGOXRCY0Z4YWxpeVJpMHJOME9lRExIUWpuNkczdENuQm9W?=
 =?utf-8?B?VWt2WDM2RFNFYXZSTlVBQ2JNUTIzcUI0eGdmS0lrSU1ScU9MYWdVeDdhaDJF?=
 =?utf-8?B?SGVyMFRZOUtzZXYrODdXNithTGtoRXVldXVWS1BrYWtSbjc3ZDhSRWxxRGdv?=
 =?utf-8?B?eXJ0TWRJczl0d2VSWW0wenYrVEoyd1ZNMWVEcHVmQ0NTeHFsdzcyejVSZXYx?=
 =?utf-8?B?VEFpRkRTc09EMVYzSlQ0bHVqTjNobVVYL3JTMzhBTWZsdlBsTVVwTkxGTEFE?=
 =?utf-8?B?L3ArdzNydXo1WlJoNmswMU9mdGk4YktXWEJDYVlEYWVnUjQzYno0cmtEUjhl?=
 =?utf-8?B?Vi80eWtlV2lLT21MajV3cTNMOWxKWlNaeTFHM0FjVkM4cXRMWVcvZ3dRTCtz?=
 =?utf-8?B?T1NRTGJKQ25lKzNraVlSU2Q5TmJUSzh6dWNwdDg5UHJGbmJxdnBtUlp6N3Np?=
 =?utf-8?B?YXdtWXdDMDNLdHRrckd0eGpZQ24yOWkzN0JNQzRWSFZvcTRIQlVGczdqb29t?=
 =?utf-8?B?QlRueTU3NWJ5NS9JOG94YjRHdWVVWkN5ZXprS0dmZHcwc1hEVWpSOXNNdGls?=
 =?utf-8?B?RHN1RFVWUmZLaFZMSmRuSXhCMkJXY1E4UmkwaW5jalR2cHlHcTJ6V05mR1BO?=
 =?utf-8?B?NmlmWU9WbU9FZFpRd2dLeGtNd01mSTkzOUdnODJGeGhwZ21QOVMwUWlaWmxO?=
 =?utf-8?B?eUVNbDdSWmJDOUFGWWprNDVtN1NwMmlJMWxhTlorYVU2TWtqR3pia2E2M08r?=
 =?utf-8?B?M3dIUnl3VlRrVnJhdEdodWFFUVNuN25rQ0NnQzh3aXhmNWFpSGw3d01xVzUw?=
 =?utf-8?B?dXpDY2lTa0pHUDArWVpVdUZ5Q0RFcFV1enNJTkJSQjdraUN2TWczRlBhcTc1?=
 =?utf-8?B?blpDV3IrQ3ZNQnc2RHQ3Q1AwSjFORUVOcjBCaE9LRlNFdmFZZzJ6SmR1ZFhv?=
 =?utf-8?B?QkZMN3NYSXZNSml1Z2c4ZFlDRS8zcldkOUV5YnBWMjg0UHRVUFo2TU5oWmdq?=
 =?utf-8?B?YStNcWU1UHdRM013NHlGRWFWUlRTbXpxQzZYS0lMK0dIV1dIM0ZnRlZYZFVn?=
 =?utf-8?B?M2NCaWpCT2s2ZVVtQmJvQ3UzZGV0TjVvV3NHS0laSXlKWnNuM2NIaTVVeldD?=
 =?utf-8?B?b3BjaTU3c08vMWQxYkVaSFh5TnY0Lzg0NTZCTEVLNjVzYmJTbUxpcTA2UEhN?=
 =?utf-8?Q?NwCGmWsFcg8TaxziK8qjABlcH?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f441e44-797e-4a12-c6a6-08dbd4c83c84
X-MS-Exchange-CrossTenant-AuthSource: DM5PR05MB3371.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 19:34:28.1232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7PnoCg/BXD4iNz8avdeQqSsMmKEn/4C6lJPS5/6ImyMCier/NX0VEaxTyQzxtcmmiaPSFyTr6m/WcFADfoCsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB10000
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 mombasawalam@vmware.com, iforbes@vmware.com, Jonathan Corbet <corbet@lwn.net>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 ppaalanen@gmail.com, spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yes, that patch should be:

Signed-off-by: Michael Banack <banackm@vmware.com>

--Michael Banack

On 10/23/23 14:29, Javier Martinez Canillas wrote:
> Albert Esteve <aesteve@redhat.com> writes:
>
>> From: Michael Banack <banackm@vmware.com>
>>
>> To clarify the intent and reasoning behind the hotspot properties
>> introduce userspace documentation that goes over cursor handling
>> in para-virtualized environments.
>>
>> The documentation is generic enough to not special case for any
>> specific hypervisor and should apply equally to all.
>>
>> Signed-off-by: Zack Rusin <zackr@vmware.com>
> The author is Michael Banack but it's missing a SoB from them.
> I don't think there's a need to resend for this, can be added
> when applying. But either Michael or Zack should confirm that
> is the correct thing to do for this patch.
>
> The doc itself looks great to me and it clarifies a lot about
> cursor hotspots.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

