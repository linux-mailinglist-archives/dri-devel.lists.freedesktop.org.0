Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB6F80C06
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 20:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0530D89319;
	Sun,  4 Aug 2019 18:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3957F891A4
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 18:39:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 56618AF47;
 Sun,  4 Aug 2019 18:39:25 +0000 (UTC)
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel test robot <rong.a.chen@intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
Date: Sun, 4 Aug 2019 20:39:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Feng Tang <feng.tang@intel.com>,
 rong.a.chen@intel.com, michel@daenzer.net,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com, lkp@01.org
Content-Type: multipart/mixed; boundary="===============0891263919=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0891263919==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kNStFUjzE590fm42KhPZBTnmR7fYcCIhF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kNStFUjzE590fm42KhPZBTnmR7fYcCIhF
Content-Type: multipart/mixed; boundary="oTmOClu80HnG45XeCbXL97I8ciqhUbAL8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel test robot <rong.a.chen@intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, lkp@01.org, ying.huang@intel.com,
 michel@daenzer.net, rong.a.chen@intel.com, Feng Tang <feng.tang@intel.com>
Message-ID: <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
In-Reply-To: <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>

--oTmOClu80HnG45XeCbXL97I8ciqhUbAL8
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

I did some further analysis on this problem and found that the blinking
cursor affects performance of the vm-scalability test case.

I only have a 4-core machine, so scalability is not really testable. Yet
I see the effects of running vm-scalibility against drm-tip, a revert of
the mgag200 patch and the vmap fixes that I posted a few days ago.

After reverting the mgag200 patch, running the test as described in the
report

  bin/lkp run job.yaml

gives results like

  2019-08-02 19:34:37  ./case-anon-cow-seq-hugetlb
  2019-08-02 19:34:37  ./usemem --runtime 300 -n 4 --prealloc --prefault
    -O -U 815395225
  917319627 bytes / 756534 usecs =3D 1184110 KB/s
  917319627 bytes / 764675 usecs =3D 1171504 KB/s
  917319627 bytes / 766414 usecs =3D 1168846 KB/s
  917319627 bytes / 777990 usecs =3D 1151454 KB/s

Running the test against current drm-tip gives slightly worse results,
such as.

  2019-08-03 19:17:06  ./case-anon-cow-seq-hugetlb
  2019-08-03 19:17:06  ./usemem --runtime 300 -n 4 --prealloc --prefault
    -O -U 815394406
  917318700 bytes / 871607 usecs =3D 1027778 KB/s
  917318700 bytes / 894173 usecs =3D 1001840 KB/s
  917318700 bytes / 919694 usecs =3D 974040 KB/s
  917318700 bytes / 923341 usecs =3D 970193 KB/s

The test puts out roughly one result per second. Strangely sending the
output to /dev/null can make results significantly worse.

  bin/lkp run job.yaml > /dev/null

  2019-08-03 19:23:04  ./case-anon-cow-seq-hugetlb
  2019-08-03 19:23:04  ./usemem --runtime 300 -n 4 --prealloc --prefault
    -O -U 815394406
  917318700 bytes / 1207358 usecs =3D 741966 KB/s
  917318700 bytes / 1210456 usecs =3D 740067 KB/s
  917318700 bytes / 1216572 usecs =3D 736346 KB/s
  917318700 bytes / 1239152 usecs =3D 722929 KB/s

I realized that there's still a blinking cursor on the screen, which I
disabled with

  tput civis

or alternatively

  echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink

Running the the test now gives the original or even better results, such =
as

  bin/lkp run job.yaml > /dev/null

  2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
  2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc --prefault
    -O -U 815394406
  917318700 bytes / 659419 usecs =3D 1358497 KB/s
  917318700 bytes / 659658 usecs =3D 1358005 KB/s
  917318700 bytes / 659916 usecs =3D 1357474 KB/s
  917318700 bytes / 660168 usecs =3D 1356956 KB/s

Rong, Feng, could you confirm this by disabling the cursor or blinking?


The difference between mgag200's original fbdev support and generic
fbdev emulation is generic fbdev's worker task that updates the VRAM
buffer from the shadow buffer. mgag200 does this immediately, but relies
on drm_can_sleep(), which is deprecated.

I think that the worker task interferes with the test case, as the
worker has been in fbdev emulation since forever and no performance
regressions have been reported so far.


So unless there's a report where this problem happens in a real-world
use case, I'd like to keep code as it is. And apparently there's always
the workaround of disabling the cursor blinking.

Best regards
Thomas


Am 30.07.19 um 19:50 schrieb Thomas Zimmermann:
> Am 29.07.19 um 11:51 schrieb kernel test robot:
>> Greeting,
>>
>> FYI, we noticed a -18.8% regression of vm-scalability.median due to co=
mmit:>
>>
>> commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4 ("drm/mgag200: Replac=
e struct mga_fbdev with generic framebuffer emulation")
>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
>=20
> Daniel, Noralf, we may have to revert this patch.
>=20
> I expected some change in display performance, but not in VM. Since it'=
s
> a server chipset, probably no one cares much about display performance.=

> So that seemed like a good trade-off for re-using shared code.
>=20
> Part of the patch set is that the generic fb emulation now maps and
> unmaps the fbdev BO when updating the screen. I guess that's the cause
> of the performance regression. And it should be visible with other
> drivers as well if they use a shadow FB for fbdev emulation.
>=20
> The thing is that we'd need another generic fbdev emulation for ast and=

> mgag200 that handles this issue properly.
>=20
> Best regards
> Thomas
>=20
>>
>> in testcase: vm-scalability
>> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz =
with 80G memory
>> with following parameters:
>>
>> 	runtime: 300s
>> 	size: 8T
>> 	test: anon-cow-seq-hugetlb
>> 	cpufreq_governor: performance
>>
>> test-description: The motivation behind this suite is to exercise func=
tions and regions of the mm/ of the Linux kernel which are of interest to=
 us.
>> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalabil=
ity.git/
>>
>>
>>
>> Details are as below:
>> ----------------------------------------------------------------------=
---------------------------->
>>
>>
>> To reproduce:
>>
>>         git clone https://github.com/intel/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email=

>>         bin/lkp run     job.yaml
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/=
testcase:
>>   gcc-7/performance/x86_64-rhel-7.6/debian-x86_64-2019-05-14.cgz/300s/=
8T/lkp-knm01/anon-cow-seq-hugetlb/vm-scalability
>>
>> commit:=20
>>   f1f8555dfb ("drm/bochs: Use shadow buffer for bochs framebuffer cons=
ole")
>>   90f479ae51 ("drm/mgag200: Replace struct mga_fbdev with generic fram=
ebuffer emulation")
>>
>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9=20
>> ---------------- ---------------------------=20
>>        fail:runs  %reproduction    fail:runs
>>            |             |             |   =20
>>           2:4          -50%            :4     dmesg.WARNING:at#for_ip_=
interrupt_entry/0x
>>            :4           25%           1:4     dmesg.WARNING:at_ip___pe=
rf_sw_event/0x
>>            :4           25%           1:4     dmesg.WARNING:at_ip__fsn=
otify_parent/0x
>>          %stddev     %change         %stddev
>>              \          |                \ =20
>>      43955 =B1  2%     -18.8%      35691        vm-scalability.median
>>       0.06 =B1  7%    +193.0%       0.16 =B1  2%  vm-scalability.media=
n_stddev
>>   14906559 =B1  2%     -17.9%   12237079        vm-scalability.through=
put
>>      87651 =B1  2%     -17.4%      72374        vm-scalability.time.in=
voluntary_context_switches
>>    2086168           -23.6%    1594224        vm-scalability.time.mino=
r_page_faults
>>      15082 =B1  2%     -10.4%      13517        vm-scalability.time.pe=
rcent_of_cpu_this_job_got
>>      29987            -8.9%      27327        vm-scalability.time.syst=
em_time
>>      15755           -12.4%      13795        vm-scalability.time.user=
_time
>>     122011           -19.3%      98418        vm-scalability.time.volu=
ntary_context_switches
>>  3.034e+09           -23.6%  2.318e+09        vm-scalability.workload
>>     242478 =B1 12%     +68.5%     408518 =B1 23%  cpuidle.POLL.time
>>       2788 =B1 21%    +117.4%       6062 =B1 26%  cpuidle.POLL.usage
>>      56653 =B1 10%     +64.4%      93144 =B1 20%  meminfo.Mapped
>>     120392 =B1  7%     +14.0%     137212 =B1  4%  meminfo.Shmem
>>      47221 =B1 11%     +77.1%      83634 =B1 22%  numa-meminfo.node0.M=
apped
>>     120465 =B1  7%     +13.9%     137205 =B1  4%  numa-meminfo.node0.S=
hmem
>>    2885513           -16.5%    2409384        numa-numastat.node0.loca=
l_node
>>    2885471           -16.5%    2409354        numa-numastat.node0.numa=
_hit
>>      11813 =B1 11%     +76.3%      20824 =B1 22%  numa-vmstat.node0.nr=
_mapped
>>      30096 =B1  7%     +13.8%      34238 =B1  4%  numa-vmstat.node0.nr=
_shmem
>>      43.72 =B1  2%      +5.5       49.20        mpstat.cpu.all.idle%
>>       0.03 =B1  4%      +0.0        0.05 =B1  6%  mpstat.cpu.all.soft%=

>>      19.51            -2.4       17.08        mpstat.cpu.all.usr%
>>       1012            -7.9%     932.75        turbostat.Avg_MHz
>>      32.38 =B1 10%     +25.8%      40.73        turbostat.CPU%c1
>>     145.51            -3.1%     141.01        turbostat.PkgWatt
>>      15.09           -19.2%      12.19        turbostat.RAMWatt
>>      43.50 =B1  2%     +13.2%      49.25        vmstat.cpu.id
>>      18.75 =B1  2%     -13.3%      16.25 =B1  2%  vmstat.cpu.us
>>     152.00 =B1  2%      -9.5%     137.50        vmstat.procs.r
>>       4800           -13.1%       4173        vmstat.system.cs
>>     156170           -11.9%     137594        slabinfo.anon_vma.active=
_objs
>>       3395           -11.9%       2991        slabinfo.anon_vma.active=
_slabs
>>     156190           -11.9%     137606        slabinfo.anon_vma.num_ob=
js
>>       3395           -11.9%       2991        slabinfo.anon_vma.num_sl=
abs
>>       1716 =B1  5%     +11.5%       1913 =B1  8%  slabinfo.dmaengine-u=
nmap-16.active_objs
>>       1716 =B1  5%     +11.5%       1913 =B1  8%  slabinfo.dmaengine-u=
nmap-16.num_objs
>>       1767 =B1  2%     -19.0%       1431 =B1  2%  slabinfo.hugetlbfs_i=
node_cache.active_objs
>>       1767 =B1  2%     -19.0%       1431 =B1  2%  slabinfo.hugetlbfs_i=
node_cache.num_objs
>>       3597 =B1  5%     -16.4%       3006 =B1  3%  slabinfo.skbuff_ext_=
cache.active_objs
>>       3597 =B1  5%     -16.4%       3006 =B1  3%  slabinfo.skbuff_ext_=
cache.num_objs
>>    1330122           -23.6%    1016557        proc-vmstat.htlb_buddy_a=
lloc_success
>>      77214 =B1  3%      +6.4%      82128 =B1  2%  proc-vmstat.nr_activ=
e_anon
>>      67277            +2.9%      69246        proc-vmstat.nr_anon_page=
s
>>     218.50 =B1  3%     -10.6%     195.25        proc-vmstat.nr_dirtied=

>>     288628            +1.4%     292755        proc-vmstat.nr_file_page=
s
>>     360.50            -2.7%     350.75        proc-vmstat.nr_inactive_=
file
>>      14225 =B1  9%     +63.8%      23304 =B1 20%  proc-vmstat.nr_mappe=
d
>>      30109 =B1  7%     +13.8%      34259 =B1  4%  proc-vmstat.nr_shmem=

>>      99870            -1.3%      98597        proc-vmstat.nr_slab_unre=
claimable
>>     204.00 =B1  4%     -12.1%     179.25        proc-vmstat.nr_written=

>>      77214 =B1  3%      +6.4%      82128 =B1  2%  proc-vmstat.nr_zone_=
active_anon
>>     360.50            -2.7%     350.75        proc-vmstat.nr_zone_inac=
tive_file
>>       8810 =B1 19%     -66.1%       2987 =B1 42%  proc-vmstat.numa_hin=
t_faults
>>       8810 =B1 19%     -66.1%       2987 =B1 42%  proc-vmstat.numa_hin=
t_faults_local
>>    2904082           -16.4%    2427026        proc-vmstat.numa_hit
>>    2904081           -16.4%    2427025        proc-vmstat.numa_local
>>  6.828e+08           -23.5%  5.221e+08        proc-vmstat.pgalloc_norm=
al
>>    2900008           -17.2%    2400195        proc-vmstat.pgfault
>>  6.827e+08           -23.5%   5.22e+08        proc-vmstat.pgfree
>>  1.635e+10           -17.0%  1.357e+10        perf-stat.i.branch-instr=
uctions
>>       1.53 =B1  4%      -0.1        1.45 =B1  3%  perf-stat.i.branch-m=
iss-rate%
>>  2.581e+08 =B1  3%     -20.5%  2.051e+08 =B1  2%  perf-stat.i.branch-m=
isses
>>      12.66            +1.1       13.78        perf-stat.i.cache-miss-r=
ate%
>>   72720849           -12.0%   63958986        perf-stat.i.cache-misses=

>>  5.766e+08           -18.6%  4.691e+08        perf-stat.i.cache-refere=
nces
>>       4674 =B1  2%     -13.0%       4064        perf-stat.i.context-sw=
itches
>>       4.29           +12.5%       4.83        perf-stat.i.cpi
>>  2.573e+11            -7.4%  2.383e+11        perf-stat.i.cpu-cycles
>>     231.35           -21.5%     181.56        perf-stat.i.cpu-migratio=
ns
>>       3522            +4.4%       3677        perf-stat.i.cycles-betwe=
en-cache-misses
>>       0.09 =B1 13%      +0.0        0.12 =B1  5%  perf-stat.i.iTLB-loa=
d-miss-rate%
>>  5.894e+10           -15.8%  4.961e+10        perf-stat.i.iTLB-loads
>>  5.901e+10           -15.8%  4.967e+10        perf-stat.i.instructions=

>>       1291 =B1 14%     -21.8%       1010        perf-stat.i.instructio=
ns-per-iTLB-miss
>>       0.24           -11.0%       0.21        perf-stat.i.ipc
>>       9476           -17.5%       7821        perf-stat.i.minor-faults=

>>       9478           -17.5%       7821        perf-stat.i.page-faults
>>       9.76            -3.6%       9.41        perf-stat.overall.MPKI
>>       1.59 =B1  4%      -0.1        1.52        perf-stat.overall.bran=
ch-miss-rate%
>>      12.61            +1.1       13.71        perf-stat.overall.cache-=
miss-rate%
>>       4.38           +10.5%       4.83        perf-stat.overall.cpi
>>       3557            +5.3%       3747        perf-stat.overall.cycles=
-between-cache-misses
>>       0.08 =B1 12%      +0.0        0.10        perf-stat.overall.iTLB=
-load-miss-rate%
>>       1268 =B1 15%     -23.0%     976.22        perf-stat.overall.inst=
ructions-per-iTLB-miss
>>       0.23            -9.5%       0.21        perf-stat.overall.ipc
>>       5815            +9.7%       6378        perf-stat.overall.path-l=
ength
>>  1.634e+10           -17.5%  1.348e+10        perf-stat.ps.branch-inst=
ructions
>>  2.595e+08 =B1  3%     -21.2%  2.043e+08 =B1  2%  perf-stat.ps.branch-=
misses
>>   72565205           -12.2%   63706339        perf-stat.ps.cache-misse=
s
>>  5.754e+08           -19.2%  4.646e+08        perf-stat.ps.cache-refer=
ences
>>       4640 =B1  2%     -12.5%       4060        perf-stat.ps.context-s=
witches
>>  2.581e+11            -7.5%  2.387e+11        perf-stat.ps.cpu-cycles
>>     229.91           -22.0%     179.42        perf-stat.ps.cpu-migrati=
ons
>>  5.889e+10           -16.3%  4.927e+10        perf-stat.ps.iTLB-loads
>>  5.899e+10           -16.3%  4.938e+10        perf-stat.ps.instruction=
s
>>       9388           -18.2%       7677        perf-stat.ps.minor-fault=
s
>>       9389           -18.2%       7677        perf-stat.ps.page-faults=

>>  1.764e+13           -16.2%  1.479e+13        perf-stat.total.instruct=
ions
>>      46803 =B1  3%     -18.8%      37982 =B1  6%  sched_debug.cfs_rq:/=
=2Eexec_clock.min
>>       5320 =B1  3%     +23.7%       6581 =B1  3%  sched_debug.cfs_rq:/=
=2Eexec_clock.stddev
>>       6737 =B1 14%     +58.1%      10649 =B1 10%  sched_debug.cfs_rq:/=
=2Eload.avg
>>     587978 =B1 17%     +58.2%     930382 =B1  9%  sched_debug.cfs_rq:/=
=2Eload.max
>>      46952 =B1 16%     +64.8%      77388 =B1 11%  sched_debug.cfs_rq:/=
=2Eload.stddev
>>       7.12 =B1  4%     +49.1%      10.62 =B1  6%  sched_debug.cfs_rq:/=
=2Eload_avg.avg
>>     474.40 =B1 23%     +67.5%     794.60 =B1 10%  sched_debug.cfs_rq:/=
=2Eload_avg.max
>>      37.70 =B1 11%     +74.8%      65.90 =B1  9%  sched_debug.cfs_rq:/=
=2Eload_avg.stddev
>>   13424269 =B1  4%     -15.6%   11328098 =B1  2%  sched_debug.cfs_rq:/=
=2Emin_vruntime.avg
>>   15411275 =B1  3%     -12.4%   13505072 =B1  2%  sched_debug.cfs_rq:/=
=2Emin_vruntime.max
>>    7939295 =B1  6%     -17.5%    6551322 =B1  7%  sched_debug.cfs_rq:/=
=2Emin_vruntime.min
>>      21.44 =B1  7%     -56.1%       9.42 =B1  4%  sched_debug.cfs_rq:/=
=2Enr_spread_over.avg
>>     117.45 =B1 11%     -60.6%      46.30 =B1 14%  sched_debug.cfs_rq:/=
=2Enr_spread_over.max
>>      19.33 =B1  8%     -66.4%       6.49 =B1  9%  sched_debug.cfs_rq:/=
=2Enr_spread_over.stddev
>>       4.32 =B1 15%     +84.4%       7.97 =B1  3%  sched_debug.cfs_rq:/=
=2Erunnable_load_avg.avg
>>     353.85 =B1 29%    +118.8%     774.35 =B1 11%  sched_debug.cfs_rq:/=
=2Erunnable_load_avg.max
>>      27.30 =B1 24%    +118.5%      59.64 =B1  9%  sched_debug.cfs_rq:/=
=2Erunnable_load_avg.stddev
>>       6729 =B1 14%     +58.2%      10644 =B1 10%  sched_debug.cfs_rq:/=
=2Erunnable_weight.avg
>>     587978 =B1 17%     +58.2%     930382 =B1  9%  sched_debug.cfs_rq:/=
=2Erunnable_weight.max
>>      46950 =B1 16%     +64.8%      77387 =B1 11%  sched_debug.cfs_rq:/=
=2Erunnable_weight.stddev
>>    5305069 =B1  4%     -17.4%    4380376 =B1  7%  sched_debug.cfs_rq:/=
=2Espread0.avg
>>    7328745 =B1  3%      -9.9%    6600897 =B1  3%  sched_debug.cfs_rq:/=
=2Espread0.max
>>    2220837 =B1  4%     +55.8%    3460596 =B1  5%  sched_debug.cpu.avg_=
idle.avg
>>    4590666 =B1  9%     +76.8%    8117037 =B1 15%  sched_debug.cpu.avg_=
idle.max
>>     485052 =B1  7%     +80.3%     874679 =B1 10%  sched_debug.cpu.avg_=
idle.stddev
>>     561.50 =B1 26%     +37.7%     773.30 =B1 15%  sched_debug.cpu.cloc=
k.stddev
>>     561.50 =B1 26%     +37.7%     773.30 =B1 15%  sched_debug.cpu.cloc=
k_task.stddev
>>       3.20 =B1 10%    +109.6%       6.70 =B1  3%  sched_debug.cpu.cpu_=
load[0].avg
>>     309.10 =B1 20%    +150.3%     773.75 =B1 12%  sched_debug.cpu.cpu_=
load[0].max
>>      21.02 =B1 14%    +160.8%      54.80 =B1  9%  sched_debug.cpu.cpu_=
load[0].stddev
>>       3.19 =B1  8%    +109.8%       6.70 =B1  3%  sched_debug.cpu.cpu_=
load[1].avg
>>     299.75 =B1 19%    +158.0%     773.30 =B1 12%  sched_debug.cpu.cpu_=
load[1].max
>>      20.32 =B1 12%    +168.7%      54.62 =B1  9%  sched_debug.cpu.cpu_=
load[1].stddev
>>       3.20 =B1  8%    +109.1%       6.69 =B1  4%  sched_debug.cpu.cpu_=
load[2].avg
>>     288.90 =B1 20%    +167.0%     771.40 =B1 12%  sched_debug.cpu.cpu_=
load[2].max
>>      19.70 =B1 12%    +175.4%      54.27 =B1  9%  sched_debug.cpu.cpu_=
load[2].stddev
>>       3.16 =B1  8%    +110.9%       6.66 =B1  6%  sched_debug.cpu.cpu_=
load[3].avg
>>     275.50 =B1 24%    +178.4%     766.95 =B1 12%  sched_debug.cpu.cpu_=
load[3].max
>>      18.92 =B1 15%    +184.2%      53.77 =B1 10%  sched_debug.cpu.cpu_=
load[3].stddev
>>       3.08 =B1  8%    +115.7%       6.65 =B1  7%  sched_debug.cpu.cpu_=
load[4].avg
>>     263.55 =B1 28%    +188.7%     760.85 =B1 12%  sched_debug.cpu.cpu_=
load[4].max
>>      18.03 =B1 18%    +196.6%      53.46 =B1 11%  sched_debug.cpu.cpu_=
load[4].stddev
>>      14543            -9.6%      13150        sched_debug.cpu.curr->pi=
d.max
>>       5293 =B1 16%     +74.7%       9248 =B1 11%  sched_debug.cpu.load=
=2Eavg
>>     587978 =B1 17%     +58.2%     930382 =B1  9%  sched_debug.cpu.load=
=2Emax
>>      40887 =B1 19%     +78.3%      72891 =B1  9%  sched_debug.cpu.load=
=2Estddev
>>    1141679 =B1  4%     +56.9%    1790907 =B1  5%  sched_debug.cpu.max_=
idle_balance_cost.avg
>>    2432100 =B1  9%     +72.6%    4196779 =B1 13%  sched_debug.cpu.max_=
idle_balance_cost.max
>>     745656           +29.3%     964170 =B1  5%  sched_debug.cpu.max_id=
le_balance_cost.min
>>     239032 =B1  9%     +81.9%     434806 =B1 10%  sched_debug.cpu.max_=
idle_balance_cost.stddev
>>       0.00 =B1 27%     +92.1%       0.00 =B1 31%  sched_debug.cpu.next=
_balance.stddev
>>       1030 =B1  4%     -10.4%     924.00 =B1  2%  sched_debug.cpu.nr_s=
witches.min
>>       0.04 =B1 26%    +139.0%       0.09 =B1 41%  sched_debug.cpu.nr_u=
ninterruptible.avg
>>     830.35 =B1  6%     -12.0%     730.50 =B1  2%  sched_debug.cpu.sche=
d_count.min
>>     912.00 =B1  2%      -9.5%     825.38        sched_debug.cpu.ttwu_c=
ount.avg
>>     433.05 =B1  3%     -19.2%     350.05 =B1  3%  sched_debug.cpu.ttwu=
_count.min
>>     160.70 =B1  3%     -12.5%     140.60 =B1  4%  sched_debug.cpu.ttwu=
_local.min
>>       9072 =B1 11%     -36.4%       5767 =B1  8%  softirqs.CPU1.RCU
>>      12769 =B1  5%     +15.3%      14718 =B1  3%  softirqs.CPU101.SCHE=
D
>>      13198           +11.5%      14717 =B1  3%  softirqs.CPU102.SCHED
>>      12981 =B1  4%     +13.9%      14788 =B1  3%  softirqs.CPU105.SCHE=
D
>>      13486 =B1  3%     +11.8%      15071 =B1  4%  softirqs.CPU111.SCHE=
D
>>      12794 =B1  4%     +14.1%      14601 =B1  9%  softirqs.CPU112.SCHE=
D
>>      12999 =B1  4%     +10.1%      14314 =B1  4%  softirqs.CPU115.SCHE=
D
>>      12844 =B1  4%     +10.6%      14202 =B1  2%  softirqs.CPU120.SCHE=
D
>>      13336 =B1  3%      +9.4%      14585 =B1  3%  softirqs.CPU122.SCHE=
D
>>      12639 =B1  4%     +20.2%      15195        softirqs.CPU123.SCHED
>>      13040 =B1  5%     +15.2%      15024 =B1  5%  softirqs.CPU126.SCHE=
D
>>      13123           +15.1%      15106 =B1  5%  softirqs.CPU127.SCHED
>>       9188 =B1  6%     -35.7%       5911 =B1  2%  softirqs.CPU13.RCU
>>      13054 =B1  3%     +13.1%      14761 =B1  5%  softirqs.CPU130.SCHE=
D
>>      13158 =B1  2%     +13.9%      14985 =B1  5%  softirqs.CPU131.SCHE=
D
>>      12797 =B1  6%     +13.5%      14524 =B1  3%  softirqs.CPU133.SCHE=
D
>>      12452 =B1  5%     +14.8%      14297        softirqs.CPU134.SCHED
>>      13078 =B1  3%     +10.4%      14439 =B1  3%  softirqs.CPU138.SCHE=
D
>>      12617 =B1  2%     +14.5%      14442 =B1  5%  softirqs.CPU139.SCHE=
D
>>      12974 =B1  3%     +13.7%      14752 =B1  4%  softirqs.CPU142.SCHE=
D
>>      12579 =B1  4%     +19.1%      14983 =B1  3%  softirqs.CPU143.SCHE=
D
>>       9122 =B1 24%     -44.6%       5053 =B1  5%  softirqs.CPU144.RCU
>>      13366 =B1  2%     +11.1%      14848 =B1  3%  softirqs.CPU149.SCHE=
D
>>      13246 =B1  2%     +22.0%      16162 =B1  7%  softirqs.CPU150.SCHE=
D
>>      13452 =B1  3%     +20.5%      16210 =B1  7%  softirqs.CPU151.SCHE=
D
>>      13507           +10.1%      14869        softirqs.CPU156.SCHED
>>      13808 =B1  3%      +9.2%      15079 =B1  4%  softirqs.CPU157.SCHE=
D
>>      13442 =B1  2%     +13.4%      15248 =B1  4%  softirqs.CPU160.SCHE=
D
>>      13311           +12.1%      14920 =B1  2%  softirqs.CPU162.SCHED
>>      13544 =B1  3%      +8.5%      14695 =B1  4%  softirqs.CPU163.SCHE=
D
>>      13648 =B1  3%     +11.2%      15179 =B1  2%  softirqs.CPU166.SCHE=
D
>>      13404 =B1  4%     +12.5%      15079 =B1  3%  softirqs.CPU168.SCHE=
D
>>      13421 =B1  6%     +16.0%      15568 =B1  8%  softirqs.CPU169.SCHE=
D
>>      13115 =B1  3%     +23.1%      16139 =B1 10%  softirqs.CPU171.SCHE=
D
>>      13424 =B1  6%     +10.4%      14822 =B1  3%  softirqs.CPU175.SCHE=
D
>>      13274 =B1  3%     +13.7%      15087 =B1  9%  softirqs.CPU185.SCHE=
D
>>      13409 =B1  3%     +12.3%      15063 =B1  3%  softirqs.CPU190.SCHE=
D
>>      13181 =B1  7%     +13.4%      14946 =B1  3%  softirqs.CPU196.SCHE=
D
>>      13578 =B1  3%     +10.9%      15061        softirqs.CPU197.SCHED
>>      13323 =B1  5%     +24.8%      16627 =B1  6%  softirqs.CPU198.SCHE=
D
>>      14072 =B1  2%     +12.3%      15798 =B1  7%  softirqs.CPU199.SCHE=
D
>>      12604 =B1 13%     +17.9%      14865        softirqs.CPU201.SCHED
>>      13380 =B1  4%     +14.8%      15356 =B1  3%  softirqs.CPU203.SCHE=
D
>>      13481 =B1  8%     +14.2%      15390 =B1  3%  softirqs.CPU204.SCHE=
D
>>      12921 =B1  2%     +13.8%      14710 =B1  3%  softirqs.CPU206.SCHE=
D
>>      13468           +13.0%      15218 =B1  2%  softirqs.CPU208.SCHED
>>      13253 =B1  2%     +13.1%      14992        softirqs.CPU209.SCHED
>>      13319 =B1  2%     +14.3%      15225 =B1  7%  softirqs.CPU210.SCHE=
D
>>      13673 =B1  5%     +16.3%      15895 =B1  3%  softirqs.CPU211.SCHE=
D
>>      13290           +17.0%      15556 =B1  5%  softirqs.CPU212.SCHED
>>      13455 =B1  4%     +14.4%      15392 =B1  3%  softirqs.CPU213.SCHE=
D
>>      13454 =B1  4%     +14.3%      15377 =B1  3%  softirqs.CPU215.SCHE=
D
>>      13872 =B1  7%      +9.7%      15221 =B1  5%  softirqs.CPU220.SCHE=
D
>>      13555 =B1  4%     +17.3%      15896 =B1  5%  softirqs.CPU222.SCHE=
D
>>      13411 =B1  4%     +20.8%      16197 =B1  6%  softirqs.CPU223.SCHE=
D
>>       8472 =B1 21%     -44.8%       4680 =B1  3%  softirqs.CPU224.RCU
>>      13141 =B1  3%     +16.2%      15265 =B1  7%  softirqs.CPU225.SCHE=
D
>>      14084 =B1  3%      +8.2%      15242 =B1  2%  softirqs.CPU226.SCHE=
D
>>      13528 =B1  4%     +11.3%      15063 =B1  4%  softirqs.CPU228.SCHE=
D
>>      13218 =B1  3%     +16.3%      15377 =B1  4%  softirqs.CPU229.SCHE=
D
>>      14031 =B1  4%     +10.2%      15467 =B1  2%  softirqs.CPU231.SCHE=
D
>>      13770 =B1  3%     +14.0%      15700 =B1  3%  softirqs.CPU232.SCHE=
D
>>      13456 =B1  3%     +12.3%      15105 =B1  3%  softirqs.CPU233.SCHE=
D
>>      13137 =B1  4%     +13.5%      14909 =B1  3%  softirqs.CPU234.SCHE=
D
>>      13318 =B1  2%     +14.7%      15280 =B1  2%  softirqs.CPU235.SCHE=
D
>>      13690 =B1  2%     +13.7%      15563 =B1  7%  softirqs.CPU238.SCHE=
D
>>      13771 =B1  5%     +20.8%      16634 =B1  7%  softirqs.CPU241.SCHE=
D
>>      13317 =B1  7%     +19.5%      15919 =B1  9%  softirqs.CPU243.SCHE=
D
>>       8234 =B1 16%     -43.9%       4616 =B1  5%  softirqs.CPU244.RCU
>>      13845 =B1  6%     +13.0%      15643 =B1  3%  softirqs.CPU244.SCHE=
D
>>      13179 =B1  3%     +16.3%      15323        softirqs.CPU246.SCHED
>>      13754           +12.2%      15438 =B1  3%  softirqs.CPU248.SCHED
>>      13769 =B1  4%     +10.9%      15276 =B1  2%  softirqs.CPU252.SCHE=
D
>>      13702           +10.5%      15147 =B1  2%  softirqs.CPU254.SCHED
>>      13315 =B1  2%     +12.5%      14980 =B1  3%  softirqs.CPU255.SCHE=
D
>>      13785 =B1  3%     +12.9%      15568 =B1  5%  softirqs.CPU256.SCHE=
D
>>      13307 =B1  3%     +15.0%      15298 =B1  3%  softirqs.CPU257.SCHE=
D
>>      13864 =B1  3%     +10.5%      15313 =B1  2%  softirqs.CPU259.SCHE=
D
>>      13879 =B1  2%     +11.4%      15465        softirqs.CPU261.SCHED
>>      13815           +13.6%      15687 =B1  5%  softirqs.CPU264.SCHED
>>     119574 =B1  2%     +11.8%     133693 =B1 11%  softirqs.CPU266.TIME=
R
>>      13688           +10.9%      15180 =B1  6%  softirqs.CPU267.SCHED
>>      11716 =B1  4%     +19.3%      13974 =B1  8%  softirqs.CPU27.SCHED=

>>      13866 =B1  3%     +13.7%      15765 =B1  4%  softirqs.CPU271.SCHE=
D
>>      13887 =B1  5%     +12.5%      15621        softirqs.CPU272.SCHED
>>      13383 =B1  3%     +19.8%      16031 =B1  2%  softirqs.CPU274.SCHE=
D
>>      13347           +14.1%      15232 =B1  3%  softirqs.CPU275.SCHED
>>      12884 =B1  2%     +21.0%      15593 =B1  4%  softirqs.CPU276.SCHE=
D
>>      13131 =B1  5%     +13.4%      14891 =B1  5%  softirqs.CPU277.SCHE=
D
>>      12891 =B1  2%     +19.2%      15371 =B1  4%  softirqs.CPU278.SCHE=
D
>>      13313 =B1  4%     +13.0%      15049 =B1  2%  softirqs.CPU279.SCHE=
D
>>      13514 =B1  3%     +10.2%      14897 =B1  2%  softirqs.CPU280.SCHE=
D
>>      13501 =B1  3%     +13.7%      15346        softirqs.CPU281.SCHED
>>      13261           +17.5%      15577        softirqs.CPU282.SCHED
>>       8076 =B1 15%     -43.7%       4546 =B1  5%  softirqs.CPU283.RCU
>>      13686 =B1  3%     +12.6%      15413 =B1  2%  softirqs.CPU284.SCHE=
D
>>      13439 =B1  2%      +9.2%      14670 =B1  4%  softirqs.CPU285.SCHE=
D
>>       8878 =B1  9%     -35.4%       5735 =B1  4%  softirqs.CPU35.RCU
>>      11690 =B1  2%     +13.6%      13274 =B1  5%  softirqs.CPU40.SCHED=

>>      11714 =B1  2%     +19.3%      13975 =B1 13%  softirqs.CPU41.SCHED=

>>      11763           +12.5%      13239 =B1  4%  softirqs.CPU45.SCHED
>>      11662 =B1  2%      +9.4%      12757 =B1  3%  softirqs.CPU46.SCHED=

>>      11805 =B1  2%      +9.3%      12902 =B1  2%  softirqs.CPU50.SCHED=

>>      12158 =B1  3%     +12.3%      13655 =B1  8%  softirqs.CPU55.SCHED=

>>      11716 =B1  4%      +8.8%      12751 =B1  3%  softirqs.CPU58.SCHED=

>>      11922 =B1  2%      +9.9%      13100 =B1  4%  softirqs.CPU64.SCHED=

>>       9674 =B1 17%     -41.8%       5625 =B1  6%  softirqs.CPU66.RCU
>>      11818           +12.0%      13237        softirqs.CPU66.SCHED
>>     124682 =B1  7%      -6.1%     117088 =B1  5%  softirqs.CPU66.TIMER=

>>       8637 =B1  9%     -34.0%       5700 =B1  7%  softirqs.CPU70.RCU
>>      11624 =B1  2%     +11.0%      12901 =B1  2%  softirqs.CPU70.SCHED=

>>      12372 =B1  2%     +13.2%      14003 =B1  3%  softirqs.CPU71.SCHED=

>>       9949 =B1 25%     -33.9%       6574 =B1 31%  softirqs.CPU72.RCU
>>      10392 =B1 26%     -35.1%       6745 =B1 35%  softirqs.CPU73.RCU
>>      12766 =B1  3%     +11.1%      14188 =B1  3%  softirqs.CPU76.SCHED=

>>      12611 =B1  2%     +18.8%      14984 =B1  5%  softirqs.CPU78.SCHED=

>>      12786 =B1  3%     +17.9%      15079 =B1  7%  softirqs.CPU79.SCHED=

>>      11947 =B1  4%      +9.7%      13103 =B1  4%  softirqs.CPU8.SCHED
>>      13379 =B1  7%     +11.8%      14962 =B1  4%  softirqs.CPU83.SCHED=

>>      13438 =B1  5%      +9.7%      14738 =B1  2%  softirqs.CPU84.SCHED=

>>      12768           +19.4%      15241 =B1  6%  softirqs.CPU88.SCHED
>>       8604 =B1 13%     -39.3%       5222 =B1  3%  softirqs.CPU89.RCU
>>      13077 =B1  2%     +17.1%      15308 =B1  7%  softirqs.CPU89.SCHED=

>>      11887 =B1  3%     +20.1%      14272 =B1  5%  softirqs.CPU9.SCHED
>>      12723 =B1  3%     +11.3%      14165 =B1  4%  softirqs.CPU90.SCHED=

>>       8439 =B1 12%     -38.9%       5153 =B1  4%  softirqs.CPU91.RCU
>>      13429 =B1  3%     +10.3%      14806 =B1  2%  softirqs.CPU95.SCHED=

>>      12852 =B1  4%     +10.3%      14174 =B1  5%  softirqs.CPU96.SCHED=

>>      13010 =B1  2%     +14.4%      14888 =B1  5%  softirqs.CPU97.SCHED=

>>    2315644 =B1  4%     -36.2%    1477200 =B1  4%  softirqs.RCU
>>       1572 =B1 10%     +63.9%       2578 =B1 39%  interrupts.CPU0.NMI:=
Non-maskable_interrupts
>>       1572 =B1 10%     +63.9%       2578 =B1 39%  interrupts.CPU0.PMI:=
Performance_monitoring_interrupts
>>     252.00 =B1 11%     -35.2%     163.25 =B1 13%  interrupts.CPU104.RE=
S:Rescheduling_interrupts
>>       2738 =B1 24%     +52.4%       4173 =B1 19%  interrupts.CPU105.NM=
I:Non-maskable_interrupts
>>       2738 =B1 24%     +52.4%       4173 =B1 19%  interrupts.CPU105.PM=
I:Performance_monitoring_interrupts
>>     245.75 =B1 19%     -31.0%     169.50 =B1  7%  interrupts.CPU105.RE=
S:Rescheduling_interrupts
>>     228.75 =B1 13%     -24.7%     172.25 =B1 19%  interrupts.CPU106.RE=
S:Rescheduling_interrupts
>>       2243 =B1 15%     +66.3%       3730 =B1 35%  interrupts.CPU113.NM=
I:Non-maskable_interrupts
>>       2243 =B1 15%     +66.3%       3730 =B1 35%  interrupts.CPU113.PM=
I:Performance_monitoring_interrupts
>>       2703 =B1 31%     +67.0%       4514 =B1 33%  interrupts.CPU118.NM=
I:Non-maskable_interrupts
>>       2703 =B1 31%     +67.0%       4514 =B1 33%  interrupts.CPU118.PM=
I:Performance_monitoring_interrupts
>>       2613 =B1 25%     +42.2%       3715 =B1 24%  interrupts.CPU121.NM=
I:Non-maskable_interrupts
>>       2613 =B1 25%     +42.2%       3715 =B1 24%  interrupts.CPU121.PM=
I:Performance_monitoring_interrupts
>>     311.50 =B1 23%     -47.7%     163.00 =B1  9%  interrupts.CPU122.RE=
S:Rescheduling_interrupts
>>     266.75 =B1 19%     -31.6%     182.50 =B1 15%  interrupts.CPU124.RE=
S:Rescheduling_interrupts
>>     293.75 =B1 33%     -32.3%     198.75 =B1 19%  interrupts.CPU125.RE=
S:Rescheduling_interrupts
>>       2601 =B1 36%     +43.2%       3724 =B1 29%  interrupts.CPU127.NM=
I:Non-maskable_interrupts
>>       2601 =B1 36%     +43.2%       3724 =B1 29%  interrupts.CPU127.PM=
I:Performance_monitoring_interrupts
>>       2258 =B1 21%     +68.2%       3797 =B1 29%  interrupts.CPU13.NMI=
:Non-maskable_interrupts
>>       2258 =B1 21%     +68.2%       3797 =B1 29%  interrupts.CPU13.PMI=
:Performance_monitoring_interrupts
>>       3338 =B1 29%     +54.6%       5160 =B1  9%  interrupts.CPU139.NM=
I:Non-maskable_interrupts
>>       3338 =B1 29%     +54.6%       5160 =B1  9%  interrupts.CPU139.PM=
I:Performance_monitoring_interrupts
>>     219.50 =B1 27%     -23.0%     169.00 =B1 21%  interrupts.CPU139.RE=
S:Rescheduling_interrupts
>>     290.25 =B1 25%     -32.5%     196.00 =B1 11%  interrupts.CPU14.RES=
:Rescheduling_interrupts
>>     243.50 =B1  4%     -16.0%     204.50 =B1 12%  interrupts.CPU140.RE=
S:Rescheduling_interrupts
>>       1797 =B1 15%    +135.0%       4223 =B1 46%  interrupts.CPU147.NM=
I:Non-maskable_interrupts
>>       1797 =B1 15%    +135.0%       4223 =B1 46%  interrupts.CPU147.PM=
I:Performance_monitoring_interrupts
>>       2537 =B1 22%     +89.6%       4812 =B1 28%  interrupts.CPU15.NMI=
:Non-maskable_interrupts
>>       2537 =B1 22%     +89.6%       4812 =B1 28%  interrupts.CPU15.PMI=
:Performance_monitoring_interrupts
>>     292.25 =B1 34%     -33.9%     193.25 =B1  6%  interrupts.CPU15.RES=
:Rescheduling_interrupts
>>     424.25 =B1 37%     -58.5%     176.25 =B1 14%  interrupts.CPU158.RE=
S:Rescheduling_interrupts
>>     312.50 =B1 42%     -54.2%     143.00 =B1 18%  interrupts.CPU159.RE=
S:Rescheduling_interrupts
>>     725.00 =B1118%     -75.7%     176.25 =B1 14%  interrupts.CPU163.RE=
S:Rescheduling_interrupts
>>       2367 =B1  6%     +59.9%       3786 =B1 24%  interrupts.CPU177.NM=
I:Non-maskable_interrupts
>>       2367 =B1  6%     +59.9%       3786 =B1 24%  interrupts.CPU177.PM=
I:Performance_monitoring_interrupts
>>     239.50 =B1 30%     -46.6%     128.00 =B1 14%  interrupts.CPU179.RE=
S:Rescheduling_interrupts
>>     320.75 =B1 15%     -24.0%     243.75 =B1 20%  interrupts.CPU20.RES=
:Rescheduling_interrupts
>>     302.50 =B1 17%     -47.2%     159.75 =B1  8%  interrupts.CPU200.RE=
S:Rescheduling_interrupts
>>       2166 =B1  5%     +92.0%       4157 =B1 40%  interrupts.CPU207.NM=
I:Non-maskable_interrupts
>>       2166 =B1  5%     +92.0%       4157 =B1 40%  interrupts.CPU207.PM=
I:Performance_monitoring_interrupts
>>     217.00 =B1 11%     -34.6%     142.00 =B1 12%  interrupts.CPU214.RE=
S:Rescheduling_interrupts
>>       2610 =B1 36%     +47.4%       3848 =B1 35%  interrupts.CPU215.NM=
I:Non-maskable_interrupts
>>       2610 =B1 36%     +47.4%       3848 =B1 35%  interrupts.CPU215.PM=
I:Performance_monitoring_interrupts
>>       2046 =B1 13%    +118.6%       4475 =B1 43%  interrupts.CPU22.NMI=
:Non-maskable_interrupts
>>       2046 =B1 13%    +118.6%       4475 =B1 43%  interrupts.CPU22.PMI=
:Performance_monitoring_interrupts
>>     289.50 =B1 28%     -41.1%     170.50 =B1  8%  interrupts.CPU22.RES=
:Rescheduling_interrupts
>>       2232 =B1  6%     +33.0%       2970 =B1 24%  interrupts.CPU221.NM=
I:Non-maskable_interrupts
>>       2232 =B1  6%     +33.0%       2970 =B1 24%  interrupts.CPU221.PM=
I:Performance_monitoring_interrupts
>>       4552 =B1 12%     -27.6%       3295 =B1 15%  interrupts.CPU222.NM=
I:Non-maskable_interrupts
>>       4552 =B1 12%     -27.6%       3295 =B1 15%  interrupts.CPU222.PM=
I:Performance_monitoring_interrupts
>>       2013 =B1 15%     +80.9%       3641 =B1 27%  interrupts.CPU226.NM=
I:Non-maskable_interrupts
>>       2013 =B1 15%     +80.9%       3641 =B1 27%  interrupts.CPU226.PM=
I:Performance_monitoring_interrupts
>>       2575 =B1 49%     +67.1%       4302 =B1 34%  interrupts.CPU227.NM=
I:Non-maskable_interrupts
>>       2575 =B1 49%     +67.1%       4302 =B1 34%  interrupts.CPU227.PM=
I:Performance_monitoring_interrupts
>>     248.00 =B1 36%     -36.3%     158.00 =B1 19%  interrupts.CPU228.RE=
S:Rescheduling_interrupts
>>       2441 =B1 24%     +43.0%       3490 =B1 30%  interrupts.CPU23.NMI=
:Non-maskable_interrupts
>>       2441 =B1 24%     +43.0%       3490 =B1 30%  interrupts.CPU23.PMI=
:Performance_monitoring_interrupts
>>     404.25 =B1 69%     -65.5%     139.50 =B1 17%  interrupts.CPU236.RE=
S:Rescheduling_interrupts
>>     566.50 =B1 40%     -73.6%     149.50 =B1 31%  interrupts.CPU237.RE=
S:Rescheduling_interrupts
>>     243.50 =B1 26%     -37.1%     153.25 =B1 21%  interrupts.CPU248.RE=
S:Rescheduling_interrupts
>>     258.25 =B1 12%     -53.5%     120.00 =B1 18%  interrupts.CPU249.RE=
S:Rescheduling_interrupts
>>       2888 =B1 27%     +49.4%       4313 =B1 30%  interrupts.CPU253.NM=
I:Non-maskable_interrupts
>>       2888 =B1 27%     +49.4%       4313 =B1 30%  interrupts.CPU253.PM=
I:Performance_monitoring_interrupts
>>       2468 =B1 44%     +67.3%       4131 =B1 37%  interrupts.CPU256.NM=
I:Non-maskable_interrupts
>>       2468 =B1 44%     +67.3%       4131 =B1 37%  interrupts.CPU256.PM=
I:Performance_monitoring_interrupts
>>     425.00 =B1 59%     -60.3%     168.75 =B1 34%  interrupts.CPU258.RE=
S:Rescheduling_interrupts
>>       1859 =B1 16%    +106.3%       3834 =B1 44%  interrupts.CPU268.NM=
I:Non-maskable_interrupts
>>       1859 =B1 16%    +106.3%       3834 =B1 44%  interrupts.CPU268.PM=
I:Performance_monitoring_interrupts
>>       2684 =B1 28%     +61.2%       4326 =B1 36%  interrupts.CPU269.NM=
I:Non-maskable_interrupts
>>       2684 =B1 28%     +61.2%       4326 =B1 36%  interrupts.CPU269.PM=
I:Performance_monitoring_interrupts
>>       2171 =B1  6%    +108.8%       4533 =B1 20%  interrupts.CPU270.NM=
I:Non-maskable_interrupts
>>       2171 =B1  6%    +108.8%       4533 =B1 20%  interrupts.CPU270.PM=
I:Performance_monitoring_interrupts
>>       2262 =B1 14%     +61.8%       3659 =B1 37%  interrupts.CPU273.NM=
I:Non-maskable_interrupts
>>       2262 =B1 14%     +61.8%       3659 =B1 37%  interrupts.CPU273.PM=
I:Performance_monitoring_interrupts
>>       2203 =B1 11%     +50.7%       3320 =B1 38%  interrupts.CPU279.NM=
I:Non-maskable_interrupts
>>       2203 =B1 11%     +50.7%       3320 =B1 38%  interrupts.CPU279.PM=
I:Performance_monitoring_interrupts
>>       2433 =B1 17%     +52.9%       3721 =B1 25%  interrupts.CPU280.NM=
I:Non-maskable_interrupts
>>       2433 =B1 17%     +52.9%       3721 =B1 25%  interrupts.CPU280.PM=
I:Performance_monitoring_interrupts
>>       2778 =B1 33%     +63.1%       4531 =B1 36%  interrupts.CPU283.NM=
I:Non-maskable_interrupts
>>       2778 =B1 33%     +63.1%       4531 =B1 36%  interrupts.CPU283.PM=
I:Performance_monitoring_interrupts
>>     331.75 =B1 32%     -39.8%     199.75 =B1 17%  interrupts.CPU29.RES=
:Rescheduling_interrupts
>>       2178 =B1 22%     +53.9%       3353 =B1 31%  interrupts.CPU3.NMI:=
Non-maskable_interrupts
>>       2178 =B1 22%     +53.9%       3353 =B1 31%  interrupts.CPU3.PMI:=
Performance_monitoring_interrupts
>>     298.50 =B1 30%     -39.7%     180.00 =B1  6%  interrupts.CPU34.RES=
:Rescheduling_interrupts
>>       2490 =B1  3%     +58.7%       3953 =B1 28%  interrupts.CPU35.NMI=
:Non-maskable_interrupts
>>       2490 =B1  3%     +58.7%       3953 =B1 28%  interrupts.CPU35.PMI=
:Performance_monitoring_interrupts
>>     270.50 =B1 24%     -31.1%     186.25 =B1  3%  interrupts.CPU36.RES=
:Rescheduling_interrupts
>>       2493 =B1  7%     +57.0%       3915 =B1 27%  interrupts.CPU43.NMI=
:Non-maskable_interrupts
>>       2493 =B1  7%     +57.0%       3915 =B1 27%  interrupts.CPU43.PMI=
:Performance_monitoring_interrupts
>>     286.75 =B1 36%     -32.4%     193.75 =B1  7%  interrupts.CPU45.RES=
:Rescheduling_interrupts
>>     259.00 =B1 12%     -23.6%     197.75 =B1 13%  interrupts.CPU46.RES=
:Rescheduling_interrupts
>>     244.00 =B1 21%     -35.6%     157.25 =B1 11%  interrupts.CPU47.RES=
:Rescheduling_interrupts
>>     230.00 =B1  7%     -21.3%     181.00 =B1 11%  interrupts.CPU48.RES=
:Rescheduling_interrupts
>>     281.00 =B1 13%     -27.4%     204.00 =B1 15%  interrupts.CPU53.RES=
:Rescheduling_interrupts
>>     256.75 =B1  5%     -18.4%     209.50 =B1 12%  interrupts.CPU54.RES=
:Rescheduling_interrupts
>>       2433 =B1  9%     +68.4%       4098 =B1 35%  interrupts.CPU58.NMI=
:Non-maskable_interrupts
>>       2433 =B1  9%     +68.4%       4098 =B1 35%  interrupts.CPU58.PMI=
:Performance_monitoring_interrupts
>>     316.00 =B1 25%     -41.4%     185.25 =B1 13%  interrupts.CPU59.RES=
:Rescheduling_interrupts
>>       2703 =B1 38%     +56.0%       4217 =B1 31%  interrupts.CPU60.NMI=
:Non-maskable_interrupts
>>       2703 =B1 38%     +56.0%       4217 =B1 31%  interrupts.CPU60.PMI=
:Performance_monitoring_interrupts
>>       2425 =B1 16%     +39.9%       3394 =B1 27%  interrupts.CPU61.NMI=
:Non-maskable_interrupts
>>       2425 =B1 16%     +39.9%       3394 =B1 27%  interrupts.CPU61.PMI=
:Performance_monitoring_interrupts
>>       2388 =B1 18%     +69.5%       4047 =B1 29%  interrupts.CPU66.NMI=
:Non-maskable_interrupts
>>       2388 =B1 18%     +69.5%       4047 =B1 29%  interrupts.CPU66.PMI=
:Performance_monitoring_interrupts
>>       2322 =B1 11%     +93.4%       4491 =B1 35%  interrupts.CPU67.NMI=
:Non-maskable_interrupts
>>       2322 =B1 11%     +93.4%       4491 =B1 35%  interrupts.CPU67.PMI=
:Performance_monitoring_interrupts
>>     319.00 =B1 40%     -44.7%     176.25 =B1  9%  interrupts.CPU67.RES=
:Rescheduling_interrupts
>>       2512 =B1  8%     +28.1%       3219 =B1 25%  interrupts.CPU70.NMI=
:Non-maskable_interrupts
>>       2512 =B1  8%     +28.1%       3219 =B1 25%  interrupts.CPU70.PMI=
:Performance_monitoring_interrupts
>>       2290 =B1 39%     +78.7%       4094 =B1 28%  interrupts.CPU74.NMI=
:Non-maskable_interrupts
>>       2290 =B1 39%     +78.7%       4094 =B1 28%  interrupts.CPU74.PMI=
:Performance_monitoring_interrupts
>>       2446 =B1 40%     +94.8%       4764 =B1 23%  interrupts.CPU75.NMI=
:Non-maskable_interrupts
>>       2446 =B1 40%     +94.8%       4764 =B1 23%  interrupts.CPU75.PMI=
:Performance_monitoring_interrupts
>>     426.75 =B1 61%     -67.7%     138.00 =B1  8%  interrupts.CPU75.RES=
:Rescheduling_interrupts
>>     192.50 =B1 13%     +45.6%     280.25 =B1 45%  interrupts.CPU76.RES=
:Rescheduling_interrupts
>>     274.25 =B1 34%     -42.2%     158.50 =B1 34%  interrupts.CPU77.RES=
:Rescheduling_interrupts
>>       2357 =B1  9%     +73.0%       4078 =B1 23%  interrupts.CPU78.NMI=
:Non-maskable_interrupts
>>       2357 =B1  9%     +73.0%       4078 =B1 23%  interrupts.CPU78.PMI=
:Performance_monitoring_interrupts
>>     348.50 =B1 53%     -47.3%     183.75 =B1 29%  interrupts.CPU80.RES=
:Rescheduling_interrupts
>>       2650 =B1 43%     +46.2%       3874 =B1 36%  interrupts.CPU84.NMI=
:Non-maskable_interrupts
>>       2650 =B1 43%     +46.2%       3874 =B1 36%  interrupts.CPU84.PMI=
:Performance_monitoring_interrupts
>>       2235 =B1 10%    +117.8%       4867 =B1 10%  interrupts.CPU90.NMI=
:Non-maskable_interrupts
>>       2235 =B1 10%    +117.8%       4867 =B1 10%  interrupts.CPU90.PMI=
:Performance_monitoring_interrupts
>>       2606 =B1 33%     +38.1%       3598 =B1 21%  interrupts.CPU92.NMI=
:Non-maskable_interrupts
>>       2606 =B1 33%     +38.1%       3598 =B1 21%  interrupts.CPU92.PMI=
:Performance_monitoring_interrupts
>>     408.75 =B1 58%     -56.8%     176.75 =B1 25%  interrupts.CPU92.RES=
:Rescheduling_interrupts
>>     399.00 =B1 64%     -63.6%     145.25 =B1 16%  interrupts.CPU93.RES=
:Rescheduling_interrupts
>>     314.75 =B1 36%     -44.2%     175.75 =B1 13%  interrupts.CPU94.RES=
:Rescheduling_interrupts
>>     191.00 =B1 15%     -29.1%     135.50 =B1  9%  interrupts.CPU97.RES=
:Rescheduling_interrupts
>>      94.00 =B1  8%     +50.0%     141.00 =B1 12%  interrupts.IWI:IRQ_w=
ork_interrupts
>>     841457 =B1  7%     +16.6%     980751 =B1  3%  interrupts.NMI:Non-m=
askable_interrupts
>>     841457 =B1  7%     +16.6%     980751 =B1  3%  interrupts.PMI:Perfo=
rmance_monitoring_interrupts
>>      12.75 =B1 11%      -4.1        8.67 =B1 31%  perf-profile.calltra=
ce.cycles-pp.do_rw_once
>>       1.02 =B1 16%      -0.6        0.47 =B1 59%  perf-profile.calltra=
ce.cycles-pp.sched_clock.sched_clock_cpu.cpuidle_enter_state.cpuidle_ente=
r.do_idle
>>       1.10 =B1 15%      -0.4        0.66 =B1 14%  perf-profile.calltra=
ce.cycles-pp.sched_clock_cpu.cpuidle_enter_state.cpuidle_enter.do_idle.cp=
u_startup_entry
>>       1.05 =B1 16%      -0.4        0.61 =B1 14%  perf-profile.calltra=
ce.cycles-pp.native_sched_clock.sched_clock.sched_clock_cpu.cpuidle_enter=
_state.cpuidle_enter
>>       1.58 =B1  4%      +0.3        1.91 =B1  7%  perf-profile.calltra=
ce.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interr=
upt.apic_timer_interrupt.copy_page
>>       0.79 =B1 26%      +0.5        1.27 =B1 18%  perf-profile.calltra=
ce.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hw=
frame
>>       0.79 =B1 26%      +0.5        1.27 =B1 18%  perf-profile.calltra=
ce.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
>>       0.79 =B1 26%      +0.5        1.27 =B1 18%  perf-profile.calltra=
ce.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
>>       2.11 =B1  4%      +0.5        2.60 =B1  7%  perf-profile.calltra=
ce.cycles-pp.apic_timer_interrupt.osq_lock.__mutex_lock.hugetlb_fault.han=
dle_mm_fault
>>       0.83 =B1 26%      +0.5        1.32 =B1 18%  perf-profile.calltra=
ce.cycles-pp.entry_SYSCALL_64_after_hwframe
>>       0.83 =B1 26%      +0.5        1.32 =B1 18%  perf-profile.calltra=
ce.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>       1.90 =B1  5%      +0.6        2.45 =B1  7%  perf-profile.calltra=
ce.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interr=
upt.copy_page.copy_subpage
>>       0.65 =B1 62%      +0.6        1.20 =B1 15%  perf-profile.calltra=
ce.cycles-pp.alloc_fresh_huge_page.alloc_surplus_huge_page.alloc_huge_pag=
e.hugetlb_cow.hugetlb_fault
>>       0.60 =B1 62%      +0.6        1.16 =B1 18%  perf-profile.calltra=
ce.cycles-pp.free_huge_page.release_pages.tlb_flush_mmu.tlb_finish_mmu.ex=
it_mmap
>>       0.95 =B1 17%      +0.6        1.52 =B1  8%  perf-profile.calltra=
ce.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interr=
upt.apic_timer_interrupt.mutex_spin_on_owner
>>       0.61 =B1 62%      +0.6        1.18 =B1 18%  perf-profile.calltra=
ce.cycles-pp.release_pages.tlb_flush_mmu.tlb_finish_mmu.exit_mmap.mmput
>>       0.61 =B1 62%      +0.6        1.19 =B1 19%  perf-profile.calltra=
ce.cycles-pp.tlb_finish_mmu.exit_mmap.mmput.do_exit.do_group_exit
>>       0.61 =B1 62%      +0.6        1.19 =B1 19%  perf-profile.calltra=
ce.cycles-pp.tlb_flush_mmu.tlb_finish_mmu.exit_mmap.mmput.do_exit
>>       0.64 =B1 61%      +0.6        1.23 =B1 18%  perf-profile.calltra=
ce.cycles-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_=
64
>>       0.64 =B1 61%      +0.6        1.23 =B1 18%  perf-profile.calltra=
ce.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_sys_exit_group
>>       1.30 =B1  9%      +0.6        1.92 =B1  8%  perf-profile.calltra=
ce.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interr=
upt.mutex_spin_on_owner.__mutex_lock
>>       0.19 =B1173%      +0.7        0.89 =B1 20%  perf-profile.calltra=
ce.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_huge_pa=
ge.release_pages.tlb_flush_mmu
>>       0.19 =B1173%      +0.7        0.90 =B1 20%  perf-profile.calltra=
ce.cycles-pp._raw_spin_lock.free_huge_page.release_pages.tlb_flush_mmu.tl=
b_finish_mmu
>>       0.00            +0.8        0.77 =B1 30%  perf-profile.calltrace=
=2Ecycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.prep_new_hug=
e_page.alloc_fresh_huge_page.alloc_surplus_huge_page
>>       0.00            +0.8        0.78 =B1 30%  perf-profile.calltrace=
=2Ecycles-pp._raw_spin_lock.prep_new_huge_page.alloc_fresh_huge_page.allo=
c_surplus_huge_page.alloc_huge_page
>>       0.00            +0.8        0.79 =B1 29%  perf-profile.calltrace=
=2Ecycles-pp.prep_new_huge_page.alloc_fresh_huge_page.alloc_surplus_huge_=
page.alloc_huge_page.hugetlb_cow
>>       0.82 =B1 67%      +0.9        1.72 =B1 22%  perf-profile.calltra=
ce.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.alloc_huge_p=
age.hugetlb_cow.hugetlb_fault
>>       0.84 =B1 66%      +0.9        1.74 =B1 20%  perf-profile.calltra=
ce.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.alloc_surplu=
s_huge_page.alloc_huge_page.hugetlb_cow
>>       2.52 =B1  6%      +0.9        3.44 =B1  9%  perf-profile.calltra=
ce.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.copy_page.copy=
_subpage.copy_user_huge_page
>>       0.83 =B1 67%      +0.9        1.75 =B1 21%  perf-profile.calltra=
ce.cycles-pp._raw_spin_lock.alloc_huge_page.hugetlb_cow.hugetlb_fault.han=
dle_mm_fault
>>       0.84 =B1 66%      +0.9        1.77 =B1 20%  perf-profile.calltra=
ce.cycles-pp._raw_spin_lock.alloc_surplus_huge_page.alloc_huge_page.huget=
lb_cow.hugetlb_fault
>>       1.64 =B1 12%      +1.0        2.67 =B1  7%  perf-profile.calltra=
ce.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.mutex_spin_on_=
owner.__mutex_lock.hugetlb_fault
>>       1.65 =B1 45%      +1.3        2.99 =B1 18%  perf-profile.calltra=
ce.cycles-pp.alloc_surplus_huge_page.alloc_huge_page.hugetlb_cow.hugetlb_=
fault.handle_mm_fault
>>       1.74 =B1 13%      +1.4        3.16 =B1  6%  perf-profile.calltra=
ce.cycles-pp.apic_timer_interrupt.mutex_spin_on_owner.__mutex_lock.hugetl=
b_fault.handle_mm_fault
>>       2.56 =B1 48%      +2.2        4.81 =B1 19%  perf-profile.calltra=
ce.cycles-pp.alloc_huge_page.hugetlb_cow.hugetlb_fault.handle_mm_fault.__=
do_page_fault
>>      12.64 =B1 14%      +3.6       16.20 =B1  8%  perf-profile.calltra=
ce.cycles-pp.mutex_spin_on_owner.__mutex_lock.hugetlb_fault.handle_mm_fau=
lt.__do_page_fault
>>       2.97 =B1  7%      +3.8        6.74 =B1  9%  perf-profile.calltra=
ce.cycles-pp.apic_timer_interrupt.copy_page.copy_subpage.copy_user_huge_p=
age.hugetlb_cow
>>      19.99 =B1  9%      +4.1       24.05 =B1  6%  perf-profile.calltra=
ce.cycles-pp.hugetlb_cow.hugetlb_fault.handle_mm_fault.__do_page_fault.do=
_page_fault
>>       1.37 =B1 15%      -0.5        0.83 =B1 13%  perf-profile.childre=
n.cycles-pp.sched_clock_cpu
>>       1.31 =B1 16%      -0.5        0.78 =B1 13%  perf-profile.childre=
n.cycles-pp.sched_clock
>>       1.29 =B1 16%      -0.5        0.77 =B1 13%  perf-profile.childre=
n.cycles-pp.native_sched_clock
>>       1.80 =B1  2%      -0.3        1.47 =B1 10%  perf-profile.childre=
n.cycles-pp.task_tick_fair
>>       0.73 =B1  2%      -0.2        0.54 =B1 11%  perf-profile.childre=
n.cycles-pp.update_curr
>>       0.42 =B1 17%      -0.2        0.27 =B1 16%  perf-profile.childre=
n.cycles-pp.account_process_tick
>>       0.73 =B1 10%      -0.2        0.58 =B1  9%  perf-profile.childre=
n.cycles-pp.rcu_sched_clock_irq
>>       0.27 =B1  6%      -0.1        0.14 =B1 14%  perf-profile.childre=
n.cycles-pp.__acct_update_integrals
>>       0.27 =B1 18%      -0.1        0.16 =B1 13%  perf-profile.childre=
n.cycles-pp.rcu_segcblist_ready_cbs
>>       0.40 =B1 12%      -0.1        0.30 =B1 14%  perf-profile.childre=
n.cycles-pp.__next_timer_interrupt
>>       0.47 =B1  7%      -0.1        0.39 =B1 13%  perf-profile.childre=
n.cycles-pp.update_rq_clock
>>       0.29 =B1 12%      -0.1        0.21 =B1 15%  perf-profile.childre=
n.cycles-pp.cpuidle_governor_latency_req
>>       0.21 =B1  7%      -0.1        0.14 =B1 12%  perf-profile.childre=
n.cycles-pp.account_system_index_time
>>       0.38 =B1  2%      -0.1        0.31 =B1 12%  perf-profile.childre=
n.cycles-pp.timerqueue_add
>>       0.26 =B1 11%      -0.1        0.20 =B1 13%  perf-profile.childre=
n.cycles-pp.find_next_bit
>>       0.23 =B1 15%      -0.1        0.17 =B1 15%  perf-profile.childre=
n.cycles-pp.rcu_dynticks_eqs_exit
>>       0.14 =B1  8%      -0.1        0.07 =B1 14%  perf-profile.childre=
n.cycles-pp.account_user_time
>>       0.17 =B1  6%      -0.0        0.12 =B1 10%  perf-profile.childre=
n.cycles-pp.cpuacct_charge
>>       0.18 =B1 20%      -0.0        0.13 =B1  3%  perf-profile.childre=
n.cycles-pp.irq_work_tick
>>       0.11 =B1 13%      -0.0        0.07 =B1 25%  perf-profile.childre=
n.cycles-pp.tick_sched_do_timer
>>       0.12 =B1 10%      -0.0        0.08 =B1 15%  perf-profile.childre=
n.cycles-pp.get_cpu_device
>>       0.07 =B1 11%      -0.0        0.04 =B1 58%  perf-profile.childre=
n.cycles-pp.raise_softirq
>>       0.12 =B1  3%      -0.0        0.09 =B1  8%  perf-profile.childre=
n.cycles-pp.write
>>       0.11 =B1 13%      +0.0        0.14 =B1  8%  perf-profile.childre=
n.cycles-pp.native_write_msr
>>       0.09 =B1  9%      +0.0        0.11 =B1  7%  perf-profile.childre=
n.cycles-pp.finish_task_switch
>>       0.10 =B1 10%      +0.0        0.13 =B1  5%  perf-profile.childre=
n.cycles-pp.schedule_idle
>>       0.07 =B1  6%      +0.0        0.10 =B1 12%  perf-profile.childre=
n.cycles-pp.__read_nocancel
>>       0.04 =B1 58%      +0.0        0.07 =B1 15%  perf-profile.childre=
n.cycles-pp.__free_pages_ok
>>       0.06 =B1  7%      +0.0        0.09 =B1 13%  perf-profile.childre=
n.cycles-pp.perf_read
>>       0.07            +0.0        0.11 =B1 14%  perf-profile.children.=
cycles-pp.perf_evsel__read_counter
>>       0.07            +0.0        0.11 =B1 13%  perf-profile.children.=
cycles-pp.cmd_stat
>>       0.07            +0.0        0.11 =B1 13%  perf-profile.children.=
cycles-pp.__run_perf_stat
>>       0.07            +0.0        0.11 =B1 13%  perf-profile.children.=
cycles-pp.process_interval
>>       0.07            +0.0        0.11 =B1 13%  perf-profile.children.=
cycles-pp.read_counters
>>       0.07 =B1 22%      +0.0        0.11 =B1 19%  perf-profile.childre=
n.cycles-pp.__handle_mm_fault
>>       0.07 =B1 19%      +0.1        0.13 =B1  8%  perf-profile.childre=
n.cycles-pp.rb_erase
>>       0.03 =B1100%      +0.1        0.09 =B1  9%  perf-profile.childre=
n.cycles-pp.smp_call_function_single
>>       0.01 =B1173%      +0.1        0.08 =B1 11%  perf-profile.childre=
n.cycles-pp.perf_event_read
>>       0.00            +0.1        0.07 =B1 13%  perf-profile.children.=
cycles-pp.__perf_event_read_value
>>       0.00            +0.1        0.07 =B1  7%  perf-profile.children.=
cycles-pp.__intel_pmu_enable_all
>>       0.08 =B1 17%      +0.1        0.15 =B1  8%  perf-profile.childre=
n.cycles-pp.native_apic_msr_eoi_write
>>       0.04 =B1103%      +0.1        0.13 =B1 58%  perf-profile.childre=
n.cycles-pp.shmem_getpage_gfp
>>       0.38 =B1 14%      +0.1        0.51 =B1  6%  perf-profile.childre=
n.cycles-pp.run_timer_softirq
>>       0.11 =B1  4%      +0.3        0.37 =B1 32%  perf-profile.childre=
n.cycles-pp.worker_thread
>>       0.20 =B1  5%      +0.3        0.48 =B1 25%  perf-profile.childre=
n.cycles-pp.ret_from_fork
>>       0.20 =B1  4%      +0.3        0.48 =B1 25%  perf-profile.childre=
n.cycles-pp.kthread
>>       0.00            +0.3        0.29 =B1 38%  perf-profile.children.=
cycles-pp.memcpy_erms
>>       0.00            +0.3        0.29 =B1 38%  perf-profile.children.=
cycles-pp.drm_fb_helper_dirty_work
>>       0.00            +0.3        0.31 =B1 37%  perf-profile.children.=
cycles-pp.process_one_work
>>       0.47 =B1 48%      +0.4        0.91 =B1 19%  perf-profile.childre=
n.cycles-pp.prep_new_huge_page
>>       0.70 =B1 29%      +0.5        1.16 =B1 18%  perf-profile.childre=
n.cycles-pp.free_huge_page
>>       0.73 =B1 29%      +0.5        1.19 =B1 18%  perf-profile.childre=
n.cycles-pp.tlb_flush_mmu
>>       0.72 =B1 29%      +0.5        1.18 =B1 18%  perf-profile.childre=
n.cycles-pp.release_pages
>>       0.73 =B1 29%      +0.5        1.19 =B1 18%  perf-profile.childre=
n.cycles-pp.tlb_finish_mmu
>>       0.76 =B1 27%      +0.5        1.23 =B1 18%  perf-profile.childre=
n.cycles-pp.exit_mmap
>>       0.77 =B1 27%      +0.5        1.24 =B1 18%  perf-profile.childre=
n.cycles-pp.mmput
>>       0.79 =B1 26%      +0.5        1.27 =B1 18%  perf-profile.childre=
n.cycles-pp.__x64_sys_exit_group
>>       0.79 =B1 26%      +0.5        1.27 =B1 18%  perf-profile.childre=
n.cycles-pp.do_group_exit
>>       0.79 =B1 26%      +0.5        1.27 =B1 18%  perf-profile.childre=
n.cycles-pp.do_exit
>>       1.28 =B1 29%      +0.5        1.76 =B1  9%  perf-profile.childre=
n.cycles-pp.perf_mux_hrtimer_handler
>>       0.77 =B1 28%      +0.5        1.26 =B1 13%  perf-profile.childre=
n.cycles-pp.alloc_fresh_huge_page
>>       1.53 =B1 15%      +0.7        2.26 =B1 14%  perf-profile.childre=
n.cycles-pp.do_syscall_64
>>       1.53 =B1 15%      +0.7        2.27 =B1 14%  perf-profile.childre=
n.cycles-pp.entry_SYSCALL_64_after_hwframe
>>       1.13 =B1  3%      +0.9        2.07 =B1 14%  perf-profile.childre=
n.cycles-pp.interrupt_entry
>>       0.79 =B1  9%      +1.0        1.76 =B1  5%  perf-profile.childre=
n.cycles-pp.perf_event_task_tick
>>       1.71 =B1 39%      +1.4        3.08 =B1 16%  perf-profile.childre=
n.cycles-pp.alloc_surplus_huge_page
>>       2.66 =B1 42%      +2.3        4.94 =B1 17%  perf-profile.childre=
n.cycles-pp.alloc_huge_page
>>       2.89 =B1 45%      +2.7        5.54 =B1 18%  perf-profile.childre=
n.cycles-pp.native_queued_spin_lock_slowpath
>>       3.34 =B1 35%      +2.7        6.02 =B1 17%  perf-profile.childre=
n.cycles-pp._raw_spin_lock
>>      12.77 =B1 14%      +3.9       16.63 =B1  7%  perf-profile.childre=
n.cycles-pp.mutex_spin_on_owner
>>      20.12 =B1  9%      +4.0       24.16 =B1  6%  perf-profile.childre=
n.cycles-pp.hugetlb_cow
>>      15.40 =B1 10%      -3.6       11.84 =B1 28%  perf-profile.self.cy=
cles-pp.do_rw_once
>>       4.02 =B1  9%      -1.3        2.73 =B1 30%  perf-profile.self.cy=
cles-pp.do_access
>>       2.00 =B1 14%      -0.6        1.41 =B1 13%  perf-profile.self.cy=
cles-pp.cpuidle_enter_state
>>       1.26 =B1 16%      -0.5        0.74 =B1 13%  perf-profile.self.cy=
cles-pp.native_sched_clock
>>       0.42 =B1 17%      -0.2        0.27 =B1 16%  perf-profile.self.cy=
cles-pp.account_process_tick
>>       0.27 =B1 19%      -0.2        0.12 =B1 17%  perf-profile.self.cy=
cles-pp.timerqueue_del
>>       0.53 =B1  3%      -0.1        0.38 =B1 11%  perf-profile.self.cy=
cles-pp.update_curr
>>       0.27 =B1  6%      -0.1        0.14 =B1 14%  perf-profile.self.cy=
cles-pp.__acct_update_integrals
>>       0.27 =B1 18%      -0.1        0.16 =B1 13%  perf-profile.self.cy=
cles-pp.rcu_segcblist_ready_cbs
>>       0.61 =B1  4%      -0.1        0.51 =B1  8%  perf-profile.self.cy=
cles-pp.task_tick_fair
>>       0.20 =B1  8%      -0.1        0.12 =B1 14%  perf-profile.self.cy=
cles-pp.account_system_index_time
>>       0.23 =B1 15%      -0.1        0.16 =B1 17%  perf-profile.self.cy=
cles-pp.rcu_dynticks_eqs_exit
>>       0.25 =B1 11%      -0.1        0.18 =B1 14%  perf-profile.self.cy=
cles-pp.find_next_bit
>>       0.10 =B1 11%      -0.1        0.03 =B1100%  perf-profile.self.cy=
cles-pp.tick_sched_do_timer
>>       0.29            -0.1        0.23 =B1 11%  perf-profile.self.cycl=
es-pp.timerqueue_add
>>       0.12 =B1 10%      -0.1        0.06 =B1 17%  perf-profile.self.cy=
cles-pp.account_user_time
>>       0.22 =B1 15%      -0.1        0.16 =B1  6%  perf-profile.self.cy=
cles-pp.scheduler_tick
>>       0.17 =B1  6%      -0.0        0.12 =B1 10%  perf-profile.self.cy=
cles-pp.cpuacct_charge
>>       0.18 =B1 20%      -0.0        0.13 =B1  3%  perf-profile.self.cy=
cles-pp.irq_work_tick
>>       0.07 =B1 13%      -0.0        0.03 =B1100%  perf-profile.self.cy=
cles-pp.update_process_times
>>       0.12 =B1  7%      -0.0        0.08 =B1 15%  perf-profile.self.cy=
cles-pp.get_cpu_device
>>       0.07 =B1 11%      -0.0        0.04 =B1 58%  perf-profile.self.cy=
cles-pp.raise_softirq
>>       0.12 =B1 11%      -0.0        0.09 =B1  7%  perf-profile.self.cy=
cles-pp.tick_nohz_get_sleep_length
>>       0.11 =B1 11%      +0.0        0.14 =B1  6%  perf-profile.self.cy=
cles-pp.native_write_msr
>>       0.10 =B1  5%      +0.1        0.15 =B1  8%  perf-profile.self.cy=
cles-pp.__remove_hrtimer
>>       0.07 =B1 23%      +0.1        0.13 =B1  8%  perf-profile.self.cy=
cles-pp.rb_erase
>>       0.08 =B1 17%      +0.1        0.15 =B1  7%  perf-profile.self.cy=
cles-pp.native_apic_msr_eoi_write
>>       0.00            +0.1        0.08 =B1 10%  perf-profile.self.cycl=
es-pp.smp_call_function_single
>>       0.32 =B1 17%      +0.1        0.42 =B1  7%  perf-profile.self.cy=
cles-pp.run_timer_softirq
>>       0.22 =B1  5%      +0.1        0.34 =B1  4%  perf-profile.self.cy=
cles-pp.ktime_get_update_offsets_now
>>       0.45 =B1 15%      +0.2        0.60 =B1 12%  perf-profile.self.cy=
cles-pp.rcu_irq_enter
>>       0.31 =B1  8%      +0.2        0.46 =B1 16%  perf-profile.self.cy=
cles-pp.irq_enter
>>       0.29 =B1 10%      +0.2        0.44 =B1 16%  perf-profile.self.cy=
cles-pp.apic_timer_interrupt
>>       0.71 =B1 30%      +0.2        0.92 =B1  8%  perf-profile.self.cy=
cles-pp.perf_mux_hrtimer_handler
>>       0.00            +0.3        0.28 =B1 37%  perf-profile.self.cycl=
es-pp.memcpy_erms
>>       1.12 =B1  3%      +0.9        2.02 =B1 15%  perf-profile.self.cy=
cles-pp.interrupt_entry
>>       0.79 =B1  9%      +0.9        1.73 =B1  5%  perf-profile.self.cy=
cles-pp.perf_event_task_tick
>>       2.49 =B1 45%      +2.1        4.55 =B1 20%  perf-profile.self.cy=
cles-pp.native_queued_spin_lock_slowpath
>>      10.95 =B1 15%      +2.7       13.61 =B1  8%  perf-profile.self.cy=
cles-pp.mutex_spin_on_owner
>>
>>
>>                                                                       =
         =20
>>                                vm-scalability.throughput              =
         =20
>>                                                                       =
         =20
>>   1.6e+07 +-+---------------------------------------------------------=
------+  =20
>>           |..+.+    +..+.+..+.+.   +.      +..+.+..+.+..+.+..+.+..+   =
 +    |  =20
>>   1.4e+07 +-+  :    :  O      O    O                           O      =
      |  =20
>>   1.2e+07 O-+O O  O O    O  O    O    O O  O  O    O    O    O      O =
 O O  O  =20
>>           |     :   :                           O    O    O       O   =
      |  =20
>>     1e+07 +-+   :  :                                                  =
      |  =20
>>           |     :  :                                                  =
      |  =20
>>     8e+06 +-+   :  :                                                  =
      |  =20
>>           |      : :                                                  =
      |  =20
>>     6e+06 +-+    : :                                                  =
      |  =20
>>     4e+06 +-+    : :                                                  =
      |  =20
>>           |      ::                                                   =
      |  =20
>>     2e+06 +-+     :                                                   =
      |  =20
>>           |       :                                                   =
      |  =20
>>         0 +-+---------------------------------------------------------=
------+  =20
>>                                                                       =
         =20
>>                                                                       =
                                                                         =
                =20
>>                          vm-scalability.time.minor_page_faults        =
         =20
>>                                                                       =
         =20
>>   2.5e+06 +-+---------------------------------------------------------=
------+  =20
>>           |                                                           =
      |  =20
>>           |..+.+    +..+.+..+.+..+.+..+.+..  .+.  .+.+..+.+..+.+..+.+.=
=2E+    |  =20
>>     2e+06 +-+  :    :                      +.   +.                    =
      |  =20
>>           O  O O: O O  O O  O O  O O                    O      O      =
      |  =20
>>           |     :   :                 O O  O  O O  O O    O  O    O O =
 O O  O  =20
>>   1.5e+06 +-+   :  :                                                  =
      |  =20
>>           |     :  :                                                  =
      |  =20
>>     1e+06 +-+    : :                                                  =
      |  =20
>>           |      : :                                                  =
      |  =20
>>           |      : :                                                  =
      |  =20
>>    500000 +-+    : :                                                  =
      |  =20
>>           |       :                                                   =
      |  =20
>>           |       :                                                   =
      |  =20
>>         0 +-+---------------------------------------------------------=
------+  =20
>>                                                                       =
         =20
>>                                                                       =
                                                                         =
                =20
>>                                 vm-scalability.workload               =
         =20
>>                                                                       =
         =20
>>   3.5e+09 +-+---------------------------------------------------------=
------+  =20
>>           | .+.                      .+.+..                        .+.=
=2E     |  =20
>>     3e+09 +-+  +    +..+.+..+.+..+.+.      +..+.+..+.+..+.+..+.+..+   =
 +    |  =20
>>           |    :    :       O O                                O      =
      |  =20
>>   2.5e+09 O-+O O: O O  O O       O O  O    O            O             =
      |  =20
>>           |     :   :                   O     O O  O O    O  O    O O =
 O O  O  =20
>>     2e+09 +-+   :  :                                                  =
      |  =20
>>           |     :  :                                                  =
      |  =20
>>   1.5e+09 +-+    : :                                                  =
      |  =20
>>           |      : :                                                  =
      |  =20
>>     1e+09 +-+    : :                                                  =
      |  =20
>>           |      : :                                                  =
      |  =20
>>     5e+08 +-+     :                                                   =
      |  =20
>>           |       :                                                   =
      |  =20
>>         0 +-+---------------------------------------------------------=
------+  =20
>>                                                                       =
         =20
>>                                                                       =
         =20
>> [*] bisect-good sample
>> [O] bisect-bad  sample
>>
>>
>>
>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are p=
rovided
>> for informational purposes only. Any difference in system hardware or =
software
>> design or configuration may affect actual performance.
>>
>>
>> Thanks,
>> Rong Chen
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=F6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=FCrnberg)


--oTmOClu80HnG45XeCbXL97I8ciqhUbAL8--

--kNStFUjzE590fm42KhPZBTnmR7fYcCIhF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1HJlsACgkQaA3BHVML
eiMfdAf/RAYFxNYwVevB5yu/Tt2V9vi78VYWCuWiQJcAFcuQI7BlE2NSa2/szt7k
7hQdWJY2nua5fUJh8ZIB3t7cJeIGupaoXOI47EHcKwmlaet7Q/J21oiV6xl98zUt
7ht85P5w/MbTsKAeH3u3z4/qpSL1W+oWHqCA/BfNw83XtHYe9ZhLR3nsewNJY6OL
laHjaXyC7MQZ/TUvI2ehtM3kTTwamreMVN9QzUc70mjJO9tdMQP0dKLW1HXOaqv5
w5jMxJJYPhwc55IK94q/POyTpguEozIJcHsgvH5MN9qwhFAC29XhBxyw5r72IlYP
zF0XogNiXlT43OpzsVCe+mnBUCyY7Q==
=x+ly
-----END PGP SIGNATURE-----

--kNStFUjzE590fm42KhPZBTnmR7fYcCIhF--

--===============0891263919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0891263919==--
