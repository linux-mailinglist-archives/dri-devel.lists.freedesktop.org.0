Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3909229591C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2316F3E8;
	Thu, 22 Oct 2020 07:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5BF6F38C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 00:35:47 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M0UF3B175000;
 Thu, 22 Oct 2020 00:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=corp-2020-01-29;
 bh=X6p05Nrg280hs5dJAZraSn2yDB6RJhwnQiWvWeyXle8=;
 b=JjtuOl3kNCyQI+kSglYNhaWv0StWwSx8WGuVWm86KVUyZwOXirHr6LeQKxbzgL5kU2eD
 dS1SVV18fcqxxX3S4cyS1KFnG6o5V8/ABpZ+d/HoGZlJ6p1Wk7ers3T1jkpDLucqCGFx
 MQpOEB+euXyFXdzH3vwxaHCAL/6JK5sqqEdfLPFfEEfnEcD/9bLcadHGmnR7d5fdesve
 B8uLDuKJxpsOerBZzJ2lFgyJq4CkFm2M5SOoLJAkGKGw3eoo3iRgphBVCrR/88SyTLi9
 84skuQQiKCNFvNFKxMo8yVa8FneXg6M8kaI87Yfgxo6PUZZaQFkHyIWtbIRPEHBkR9js 7A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 34ak16kp4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 22 Oct 2020 00:35:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M0U8i6177306;
 Thu, 22 Oct 2020 00:33:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 348a6q14tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 00:33:41 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09M0XXIs025094;
 Thu, 22 Oct 2020 00:33:33 GMT
Received: from dhcp-10-159-149-46.vpn.oracle.com (/10.159.149.46)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Oct 2020 17:33:33 -0700
From: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Message-Id: <8D07D0F4-30AD-454E-93A2-97446821AB4B@oracle.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_7EAC6426-4344-4B10-AFC9-72304A5EF163"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
Date: Wed, 21 Oct 2020 17:33:31 -0700
In-Reply-To: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
To: linux-kernel@vger.kernel.org
References: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=5 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220001
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=5 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220001
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Apple-Mail=_7EAC6426-4344-4B10-AFC9-72304A5EF163
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Attached the Syzkaller C reproducer.


--Apple-Mail=_7EAC6426-4344-4B10-AFC9-72304A5EF163
Content-Disposition: attachment;
	filename=repro.c
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="repro.c"
Content-Transfer-Encoding: 7bit

#define _GNU_SOURCE

#include <dirent.h>
#include <endian.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <signal.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#include <linux/futex.h>

static void sleep_ms(uint64_t ms)
{
    usleep(ms * 1000);
}

static uint64_t current_time_ms(void)
{
    struct timespec ts;
    if (clock_gettime(CLOCK_MONOTONIC, &ts))
    exit(1);
    return (uint64_t)ts.tv_sec * 1000 + (uint64_t)ts.tv_nsec / 1000000;
}

static void thread_start(void* (*fn)(void*), void* arg)
{
    pthread_t th;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    pthread_attr_setstacksize(&attr, 128 << 10);
    int i;
    for (i = 0; i < 100; i++) {
        if (pthread_create(&th, &attr, fn, arg) == 0) {
            pthread_attr_destroy(&attr);
            return;
        }
        if (errno == EAGAIN) {
            usleep(50);
            continue;
        }
        break;
    }
    exit(1);
}

typedef struct {
    int state;
} event_t;

static void event_init(event_t* ev)
{
    ev->state = 0;
}

static void event_reset(event_t* ev)
{
    ev->state = 0;
}

static void event_set(event_t* ev)
{
    if (ev->state)
    exit(1);
    __atomic_store_n(&ev->state, 1, __ATOMIC_RELEASE);
    syscall(SYS_futex, &ev->state, FUTEX_WAKE | FUTEX_PRIVATE_FLAG, 1000000);
}

static void event_wait(event_t* ev)
{
    while (!__atomic_load_n(&ev->state, __ATOMIC_ACQUIRE))
        syscall(SYS_futex, &ev->state, FUTEX_WAIT | FUTEX_PRIVATE_FLAG, 0,
0);
}

static int event_isset(event_t* ev)
{
    return __atomic_load_n(&ev->state, __ATOMIC_ACQUIRE);
}

static int event_timedwait(event_t* ev, uint64_t timeout)
{
    uint64_t start = current_time_ms();
    uint64_t now = start;
    for (;;) {
        uint64_t remain = timeout - (now - start);
        struct timespec ts;
        ts.tv_sec = remain / 1000;
        ts.tv_nsec = (remain % 1000) * 1000 * 1000;
        syscall(SYS_futex, &ev->state, FUTEX_WAIT | FUTEX_PRIVATE_FLAG, 0,
&ts);
        if (__atomic_load_n(&ev->state, __ATOMIC_RELAXED))
            return 1;
        now = current_time_ms();
        if (now - start > timeout)
            return 0;
    }
}

static bool write_file(const char* file, const char* what, ...)
{
    char buf[1024];
    va_list args;
    va_start(args, what);
    vsnprintf(buf, sizeof(buf), what, args);
    va_end(args);
    buf[sizeof(buf) - 1] = 0;
    int len = strlen(buf);
    int fd = open(file, O_WRONLY | O_CLOEXEC);
    if (fd == -1)
        return false;
    if (write(fd, buf, len) != len) {
        int err = errno;
        close(fd);
        errno = err;
        return false;
    }
    close(fd);
    return true;
}

static long syz_open_dev(volatile long a0, volatile long a1, volatile long
a2)
{
    if (a0 == 0xc || a0 == 0xb) {
        char buf[128];
        sprintf(buf, "/dev/%s/%d:%d", a0 == 0xc ? "char" : "block",
(uint8_t)a1, (uint8_t)a2);
        return open(buf, O_RDWR, 0);
    } else {
        char buf[1024];
        char* hash;
strncpy(buf, (char*)a0, sizeof(buf) - 1);
        buf[sizeof(buf) - 1] = 0;
        while ((hash = strchr(buf, '#'))) {
            *hash = '0' + (char)(a1 % 10);
            a1 /= 10;
        }
        return open(buf, a2, 0);
    }
}

static void kill_and_wait(int pid, int* status)
{
    kill(-pid, SIGKILL);
    kill(pid, SIGKILL);
    int i;
    for (i = 0; i < 100; i++) {
        if (waitpid(-1, status, WNOHANG | __WALL) == pid)
            return;
        usleep(1000);
    }
    DIR* dir = opendir("/sys/fs/fuse/connections");
    if (dir) {
        for (;;) {
            struct dirent* ent = readdir(dir);
            if (!ent)
                break;
            if (strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") ==
0)
                continue;
            char abort[300];
            snprintf(abort, sizeof(abort),
"/sys/fs/fuse/connections/%s/abort", ent->d_name);
            int fd = open(abort, O_WRONLY);
            if (fd == -1) {
                continue;
            }
            if (write(fd, abort, 1) < 0) {
            }
            close(fd);
        }
        closedir(dir);
    } else {
    }
    while (waitpid(-1, status, __WALL) != pid) {
    }
}

static void setup_test()
{
    prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
    setpgrp();
    write_file("/proc/self/oom_score_adj", "1000");
}

struct thread_t {
    int created, call;
    event_t ready, done;
};

static struct thread_t threads[16];
static void execute_call(int call);
static int running;

static void* thr(void* arg)
{
    struct thread_t* th = (struct thread_t*)arg;
    for (;;) {
        event_wait(&th->ready);
        event_reset(&th->ready);
        execute_call(th->call);
        __atomic_fetch_sub(&running, 1, __ATOMIC_RELAXED);
        event_set(&th->done);
    }
    return 0;
}

static void execute_one(void)
{
    int i, call, thread;
    int collide = 0;
again:
    for (call = 0; call < 6; call++) {
        for (thread = 0; thread < (int)(sizeof(threads) /
sizeof(threads[0])); thread++) {
            struct thread_t* th = &threads[thread];
            if (!th->created) {
                th->created = 1;
                event_init(&th->ready);
                event_init(&th->done);
                event_set(&th->done);
                thread_start(thr, th);
            }
            if (!event_isset(&th->done))
                continue;
            event_reset(&th->done);
            th->call = call;
            __atomic_fetch_add(&running, 1, __ATOMIC_RELAXED);
            event_set(&th->ready);
            if (collide && (call % 2) == 0)
                break;
            event_timedwait(&th->done, 45);
            break;
        }
    }
    for (i = 0; i < 100 && __atomic_load_n(&running, __ATOMIC_RELAXED); i++)
        sleep_ms(1);
    if (!collide) {
        collide = 1;
        goto again;
    }
}

static void execute_one(void);

#define WAIT_FLAGS __WALL

static void loop(void)
{
    int iter;
    for (iter = 0;; iter++) {
        int pid = fork();
        if (pid < 0)
    exit(1);
        if (pid == 0) {
            setup_test();
            execute_one();
            exit(0);
        }
        int status = 0;
        uint64_t start = current_time_ms();
        for (;;) {
            if (waitpid(-1, &status, WNOHANG | WAIT_FLAGS) == pid)
                break;
            sleep_ms(1);
            if (current_time_ms() - start < 5 * 1000)
                continue;
            kill_and_wait(pid, &status);
            break;
        }
    }
}

uint64_t r[2] = {0xffffffffffffffff, 0xffffffffffffffff};

void execute_call(int call)
{
        intptr_t res;    switch (call) {
    case 0:
memcpy((void*)0x20000000, "/dev/fb0\000", 9);
        res = syscall(__NR_openat, 0xffffffffffffff9cul, 0x20000000ul, 0ul,
0ul);
        if (res != -1)
                r[0] = res;
        break;
    case 1:
*(uint32_t*)0x20000100 = 0;
*(uint32_t*)0x20000104 = 0x10;
*(uint32_t*)0x20000108 = 0;
*(uint32_t*)0x2000010c = 0;
*(uint32_t*)0x20000110 = 0;
*(uint32_t*)0x20000114 = 0;
*(uint32_t*)0x20000118 = 0;
*(uint32_t*)0x2000011c = 0;
*(uint32_t*)0x20000120 = 0;
*(uint32_t*)0x20000124 = 0;
*(uint32_t*)0x20000128 = 0;
*(uint32_t*)0x2000012c = 0;
*(uint32_t*)0x20000130 = 0;
*(uint32_t*)0x20000134 = 0;
*(uint32_t*)0x20000138 = 0;
*(uint32_t*)0x2000013c = 0;
*(uint32_t*)0x20000140 = 0;
*(uint32_t*)0x20000144 = 0;
*(uint32_t*)0x20000148 = 0;
*(uint32_t*)0x2000014c = 0;
*(uint32_t*)0x20000150 = 0;
*(uint32_t*)0x20000154 = 0;
*(uint32_t*)0x20000158 = 0;
*(uint32_t*)0x2000015c = 0;
*(uint32_t*)0x20000160 = 0;
*(uint32_t*)0x20000164 = 0;
*(uint32_t*)0x20000168 = 0;
*(uint32_t*)0x2000016c = 0;
*(uint32_t*)0x20000170 = 0;
*(uint32_t*)0x20000174 = 0;
*(uint32_t*)0x20000178 = 0;
*(uint32_t*)0x2000017c = 0;
*(uint32_t*)0x20000180 = 0;
*(uint32_t*)0x20000184 = 0;
*(uint32_t*)0x20000188 = 0;
*(uint32_t*)0x2000018c = 0;
*(uint32_t*)0x20000190 = 0;
*(uint32_t*)0x20000194 = 0;
*(uint32_t*)0x20000198 = 0;
*(uint32_t*)0x2000019c = 0;
        syscall(__NR_ioctl, r[0], 0x4601ul, 0x20000100ul);
        break;
    case 2:
        syscall(__NR_socket, 0xaul, 3ul, 0x3aul);
        break;
    case 3:
        res = syz_open_dev(0xc, 4, 0x14);
        if (res != -1)
                r[1] = res;
        break;
    case 4:
        syscall(__NR_ioctl, r[1], 0x5437ul, 0ul);
        break;
    case 5:
        syscall(__NR_ioctl, r[1], 0x5606ul, 8ul);
        break;
    }

}
int main(void)
{
        syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 3ul, 0x32ul, -1, 0);
            loop();
    return 0;
}


--Apple-Mail=_7EAC6426-4344-4B10-AFC9-72304A5EF163
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On Oct 21, 2020, at 4:57 PM, saeed.mirzamohammadi@oracle.com wrote:
>=20
> From: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
>=20
> This patch fixes the issue due to:
>=20
> [   89.572883] divide_error: 0000 [#1] SMP KASAN PTI
> [   89.572897] CPU: 3 PID: 16083 Comm: repro Not tainted =
5.9.0-rc7.20200930.rc1.allarch-19-g3e32d0d.syzk #5
> [   89.572902] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =
BIOS 0.5.1 01/01/2011
> [   89.572934] RIP: 0010:cirrusfb_check_var+0x84/0x1260
>=20
> The error happens when the pixels value is calculated before =
performing the sanity checks on bits_per_pixel.
> A bits_per_pixel set to zero causes divide by zero error.
>=20
> This patch moves the calculation after the sanity check.
>=20
> Signed-off-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
> Tested-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
> ---
> drivers/video/fbdev/cirrusfb.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/cirrusfb.c =
b/drivers/video/fbdev/cirrusfb.c
> index 15a9ee7cd734..a7749101b094 100644
> --- a/drivers/video/fbdev/cirrusfb.c
> +++ b/drivers/video/fbdev/cirrusfb.c
> @@ -531,7 +531,7 @@ static int cirrusfb_check_var(struct =
fb_var_screeninfo *var,
> {
> 	int yres;
> 	/* memory size in pixels */
> -	unsigned pixels =3D info->screen_size * 8 / var->bits_per_pixel;
> +	unsigned int pixels;
> 	struct cirrusfb_info *cinfo =3D info->par;
>=20
> 	switch (var->bits_per_pixel) {
> @@ -573,6 +573,7 @@ static int cirrusfb_check_var(struct =
fb_var_screeninfo *var,
> 		return -EINVAL;
> 	}
>=20
> +	pixels =3D info->screen_size * 8 / var->bits_per_pixel;
> 	if (var->xres_virtual < var->xres)
> 		var->xres_virtual =3D var->xres;
> 	/* use highest possible virtual resolution */
> --=20
> 2.27.0
>=20


--Apple-Mail=_7EAC6426-4344-4B10-AFC9-72304A5EF163
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--Apple-Mail=_7EAC6426-4344-4B10-AFC9-72304A5EF163--
