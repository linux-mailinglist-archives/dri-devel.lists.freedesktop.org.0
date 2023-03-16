Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BB26BD14E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 14:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA8810E221;
	Thu, 16 Mar 2023 13:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56AD10E221
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678974556; i=deller@gmx.de;
 bh=agxNq3M4Nq9P/qotrHDdI6OXkiuxR9i6mnQAxGGSnVg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Zwep2Glw6NS+ioLP6P9wpZti664aM7+Q71cEZBhgoysO5r2HxGmiYW60FU0KBhRJc
 Xs6SiRFuo0Is9adjvhFUVUo08e7NIpUkaDhIqJi2nUV9Jm1Yjhr3G02BiV4IJmAZz4
 ws4s2BXfGz7UpZ7hPM0FRWB0mn5TzXvjta54ZEfY/SKEyT0I93CUGNCuNbCvf73Acs
 d0doPcAPe0iYDsW1GYkPVpmIoFhsGJyGwhc6ExenlLTza4JwvpjYUtFTVFh7yBpOWg
 Myqms+x8TOQXfiao26Wtr5ojnzQF4Xe5yXJv+KidBUF4wqX3umuphH4mxr41Zm3iGL
 wzgsj5LsDaYWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.149.95]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McY8d-1qF9bK3fX3-00cx25; Thu, 16
 Mar 2023 14:49:15 +0100
Message-ID: <0f723aa2-8bc8-dcbb-9ac5-3fd262b77e7f@gmx.de>
Date: Thu, 16 Mar 2023 14:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] fbdev: Use of_property_present() for testing DT property
 presence
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230310144729.1545943-1-robh@kernel.org>
 <202303111229.3Uuc8JQV-lkp@intel.com>
 <CAL_Jsq+kE3v+=WptWet=JHp2-FCOFah_YzWHFbbfSH-Wh_0o5A@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAL_Jsq+kE3v+=WptWet=JHp2-FCOFah_YzWHFbbfSH-Wh_0o5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ag0Cdw3QsToMHSHKsswXReHgTml0jf0vMyCXqp/o+DQ8m3DuMSo
 P1h6Z6g30Gcx/njFG7r+vgh3QmF8eobulUM0LCNimttShhxF1GDnDuKyM3IE2N8zfLDZA9q
 7L2k4nEIqqX55NdQfZGGjWoJpxju6Xulf0WN8/IO1loC/1et3YwuKpPWNXxQjWTqHfXHk41
 cbmUtulvtAUSNOZIQXVcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ktC9vgx9RnM=;ePXB1LWpPUBT9Qtnsp9xOlM4da8
 HZS9Fkmk1l6JRv83Gh/sMpyKLeeJ5kHjX4vpGig0ukExHNTL449+5QQLk7Q+6kvzxiTaSkx2N
 O6HwjlpsCFJ+Yh1IqZPLR6AjqvXqPdkDdZn7IUBbc57dZqtrQ1g6iwTq/Q9UECeKo/TdhObXl
 UHmdvumdL0aoyAzQx2Bx/OWn3lfDtJpm5jwDLhhRHb3trhDDvVmJJFS4hV+SRv2LQ4hLR0hlk
 Ld/DzbF/EEsKoU+ELFl17/8R5uCAB7xhPHksU31Qf8XCdD6vyIRw37b6TqRF5zNo6w6ut4gKQ
 Apl/5+qgmVEUZzOWLI1U/7oZeNNXXVmTGdO7CmZxHoXatHkqBSHJZVu9GnYLn6aWuj6kKkqzo
 XPVCPQeGgRcl6QnGjNkFPGaL7vRKBbEEhCGwUWmcvpNOAL3veo5Cw3HTOeoeX908urPUJ751E
 wjpTgQWCfqMjvNg3ZRydg0S1ydBJ00yKVDmFQojA+QzC5TjN67d/aE6nuQQef13wxPMUVPe5y
 JPIByae6IayYqhfI23eVsXpOrGKC4eKzl5nOv4ZXjFrhV/Q/DzOp4ufKMFZ/uf8RgRbtJ1XCd
 SSyGPuZIiGzqlX/7FxMD2OS4iUa3Y3/p4oI/QpT+7diW2HW1CFY43DgfI/Cj7O5vsAu2ZHj8B
 4Nni1+PsAp2LjHzK0Wh4YlFHOTLszrkhsA2cgjUArnXt5c2E855ps4pzQLlGAxFuA6ANVtJ47
 aWPWUfPRVrMti+V5h/bBX/IypkmjO4xNQ7i8ajw22z+NaFXmbvI16d3VDaVaNbIggdylmJ1pU
 o7037jUgoZ5nrdkspGkZlo0KkqIG/HT48zBDd5k3JiyykNj5rMsVuJBX5uf7ohqIA4NmxmX8i
 GgoWm4xMOWNBv0sb67uSxQZ6SLBEtaGkmA+iMdu6tCrCsR9+efpdhLUxrmkB9ol3HQx2OzBoJ
 LK0DvQd/X8iXjVwMgFvasZTqnHk=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/11/23 16:15, Rob Herring wrote:
> On Fri, Mar 10, 2023 at 10:41=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
>>
>> Hi Rob,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on drm-misc/drm-misc-next]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/fbde=
v-Use-of_property_present-for-testing-DT-property-presence/20230310-225754
>> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>> patch link:    https://lore.kernel.org/r/20230310144729.1545943-1-robh%=
40kernel.org
>> patch subject: [PATCH] fbdev: Use of_property_present() for testing DT =
property presence
>> config: arm64-randconfig-r032-20230310 (https://download.01.org/0day-ci=
/archive/20230311/202303111229.3Uuc8JQV-lkp@intel.com/config)
>> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67=
409911353323ca5edf2049ef0df54132fa1ca7)
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install arm64 cross compiling tool for clang build
>>          # apt-get install binutils-aarch64-linux-gnu
>>          # https://github.com/intel-lab-lkp/linux/commit/c013f4111f36b0=
b4327e7fbf46c0dd93399e9209
>>          git remote add linux-review https://github.com/intel-lab-lkp/l=
inux
>>          git fetch --no-tags linux-review Rob-Herring/fbdev-Use-of_prop=
erty_present-for-testing-DT-property-presence/20230310-225754
>>          git checkout c013f4111f36b0b4327e7fbf46c0dd93399e9209
>
> Looks like this patch was applied to drm-next which was/is based on
> v6.2-rc6. This patch is dependent on a change in v6.3-rc1.

I've applied that patch now to fbdev git tree.
Will drop it again in case it conflicts somewhere.

Thanks!
Helge
